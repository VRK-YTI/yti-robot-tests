def parse_comment_round_urls_with_label(json, label):
    comment_rounds = [x["commentRounds"] for x in json["results"]]
    comment_round_urls = [[y["url"] for y in x if label == y["label"]] for x in comment_rounds]
    comment_round_urls = sum(comment_round_urls, [])
    return comment_round_urls


def parse_terminology_urls_with_value(json, value):
    terminology_ids = [x["id"] for x in json if x["properties"]["prefLabel"][0]["value"] == value]
    return terminology_ids


def find_prefix_from_terminology_search(response_json, label):
    for result in response_json.get("responseObjects", []):
        labels = result.get("label", {})
        if label in labels.values():
            return result["prefix"]
    raise ValueError(f"Terminology with label '{label}' not found in search results")


def build_terminology_json(prefix, label_fi, status, organization, domain, languages=None):
    import json
    if languages is None:
        languages = ["fi"]
    return json.dumps({
        "prefix": prefix,
        "label": {"fi": label_fi},
        "languages": languages,
        "status": status,
        "organizations": [organization],
        "groups": [domain],
        "graphType": "TERMINOLOGICAL_VOCABULARY"
    })


def build_concept_json(identifier, concept_label_fi, status):
    import json
    return json.dumps({
        "identifier": identifier,
        "status": status,
        "recommendedTerms": [{"language": "fi", "label": concept_label_fi, "status": status}]
    })


def build_collection_json(identifier, label_fi, members):
    import json
    return json.dumps({
        "identifier": identifier,
        "label": {"fi": label_fi},
        "members": list(members) if not isinstance(members, list) else members
    })


def build_collection_update_json(label_fi, members):
    import json
    return json.dumps({
        "label": {"fi": label_fi},
        "members": list(members) if not isinstance(members, list) else members
    })
