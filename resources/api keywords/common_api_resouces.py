def parse_comment_round_urls_with_label(json, label):
    comment_rounds = [x["commentRounds"] for x in json["results"]]
    comment_round_urls = [[y["url"] for y in x if label == y["label"]] for x in comment_rounds]
    comment_round_urls = sum(comment_round_urls, [])
    return comment_round_urls


def parse_terminology_urls_with_value(json, value):
    terminology_ids = [x["id"] for x in json if x["properties"]["prefLabel"][0]["value"] == value]
    return terminology_ids
