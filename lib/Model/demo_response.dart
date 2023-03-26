// To parse this JSON data, do
//
//     final demoResponse = demoResponseFromJson(jsonString);

import 'dart:convert';

class DemoResponse {
  DemoResponse({
    required this.id,
    required this.date,
    required this.slug,
    required this.type,
    required this.link,
    required this.title,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.appleNewsNotices,
    required this.jetpackFeaturedMediaUrl,
    required this.parsely,
    required this.shortlink,
    required this.parselyMeta,
    required this.rapidData,
    required this.premiumContent,
    required this.premiumCutoffPercent,
    required this.featured,
    required this.subtitle,
    required this.editorialContentProvider,
    required this.tcCbMapping,
    required this.associatedEvent,
    required this.event,
    required this.authors,
    required this.hideFeaturedImage,
    required this.canonicalUrl,
    required this.primaryCategory,
    required this.links,
  });

  int id;
  DateTime date;
  String slug;
  String type;
  String link;
  Title title;
  Excerpt excerpt;
  int author;
  int featuredMedia;
  List<dynamic> appleNewsNotices;
  String jetpackFeaturedMediaUrl;
  Parsely parsely;
  String shortlink;
  ParselyMeta parselyMeta;
  RapidData rapidData;
  bool premiumContent;
  double premiumCutoffPercent;
  bool featured;
  String subtitle;
  String editorialContentProvider;
  List<dynamic> tcCbMapping;
  dynamic associatedEvent;
  dynamic event;
  List<int> authors;
  bool hideFeaturedImage;
  String canonicalUrl;
  PrimaryCategory primaryCategory;
  Links links;

  factory DemoResponse.fromRawJson(String str) =>
      DemoResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DemoResponse.fromJson(Map<String, dynamic> json) => DemoResponse(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        type: json["type"],
        link: json["link"],
        title: Title.fromJson(json["title"]),
        excerpt: Excerpt.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        appleNewsNotices:
            List<dynamic>.from(json["apple_news_notices"].map((x) => x)),
        jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
        parsely: Parsely.fromJson(json["parsely"]),
        shortlink: json["shortlink"],
        parselyMeta: ParselyMeta.fromJson(json["parselyMeta"]),
        rapidData: RapidData.fromJson(json["rapidData"]),
        premiumContent: json["premiumContent"],
        premiumCutoffPercent: json["premiumCutoffPercent"]?.toDouble(),
        featured: json["featured"],
        subtitle: json["subtitle"],
        editorialContentProvider: json["editorialContentProvider"],
        tcCbMapping: List<dynamic>.from(json["tc_cb_mapping"].map((x) => x)),
        associatedEvent: json["associatedEvent"],
        event: json["event"],
        authors: List<int>.from(json["authors"].map((x) => x)),
        hideFeaturedImage: json["hide_featured_image"],
        canonicalUrl: json["canonical_url"],
        primaryCategory: PrimaryCategory.fromJson(json["primary_category"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "apple_news_notices":
            List<dynamic>.from(appleNewsNotices.map((x) => x)),
        "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
        "parsely": parsely.toJson(),
        "shortlink": shortlink,
        "parselyMeta": parselyMeta.toJson(),
        "rapidData": rapidData.toJson(),
        "premiumContent": premiumContent,
        "premiumCutoffPercent": premiumCutoffPercent,
        "featured": featured,
        "subtitle": subtitle,
        "editorialContentProvider": editorialContentProvider,
        "tc_cb_mapping": List<dynamic>.from(tcCbMapping.map((x) => x)),
        "associatedEvent": associatedEvent,
        "event": event,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "hide_featured_image": hideFeaturedImage,
        "canonical_url": canonicalUrl,
        "primary_category": primaryCategory.toJson(),
        "_links": links.toJson(),
      };
}

class Excerpt {
  Excerpt({
    required this.rendered,
    required this.protected,
  });

  String rendered;
  bool protected;

  factory Excerpt.fromRawJson(String str) => Excerpt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Excerpt.fromJson(Map<String, dynamic> json) => Excerpt(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.replies,
    required this.versionHistory,
    required this.predecessorVersion,
    required this.authors,
    required this.httpsTechcrunchComEdit,
    required this.author,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> replies;
  List<VersionHistory> versionHistory;
  List<PredecessorVersion> predecessorVersion;
  List<Author> authors;
  List<About> httpsTechcrunchComEdit;
  List<Author> author;
  List<Author> wpFeaturedmedia;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(
            json["predecessor-version"]
                .map((x) => PredecessorVersion.fromJson(x))),
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        httpsTechcrunchComEdit: List<About>.from(
            json["https://techcrunch.com/edit"].map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(
            json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version":
            List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "https://techcrunch.com/edit":
            List<dynamic>.from(httpsTechcrunchComEdit.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class About {
  About({
    required this.href,
  });

  String href;

  factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  Author({
    required this.embeddable,
    required this.href,
  });

  bool embeddable;
  String href;

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  String name;
  String href;
  bool templated;

  factory Cury.fromRawJson(String str) => Cury.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class PredecessorVersion {
  PredecessorVersion({
    required this.id,
    required this.href,
  });

  int id;
  String href;

  factory PredecessorVersion.fromRawJson(String str) =>
      PredecessorVersion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    required this.count,
    required this.href,
  });

  int count;
  String href;

  factory VersionHistory.fromRawJson(String str) =>
      VersionHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  String taxonomy;
  bool embeddable;
  String href;

  factory WpTerm.fromRawJson(String str) => WpTerm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class Parsely {
  Parsely({
    required this.version,
    required this.meta,
    required this.rendered,
  });

  String version;
  List<dynamic> meta;
  String rendered;

  factory Parsely.fromRawJson(String str) => Parsely.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parsely.fromJson(Map<String, dynamic> json) => Parsely(
        version: json["version"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "rendered": rendered,
      };
}

class ParselyMeta {
  ParselyMeta({
    required this.parselyTitle,
    required this.parselyLink,
    required this.parselyType,
    required this.parselyPubDate,
    required this.parselyImageUrl,
    required this.parselyAuthor,
    required this.parselySection,
    required this.parselyTags,
    required this.parselyMetadata,
  });

  String parselyTitle;
  String parselyLink;
  String parselyType;
  DateTime parselyPubDate;
  String parselyImageUrl;
  List<String> parselyAuthor;
  String parselySection;
  String parselyTags;
  String parselyMetadata;

  factory ParselyMeta.fromRawJson(String str) =>
      ParselyMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParselyMeta.fromJson(Map<String, dynamic> json) => ParselyMeta(
        parselyTitle: json["parsely-title"],
        parselyLink: json["parsely-link"],
        parselyType: json["parsely-type"],
        parselyPubDate: DateTime.parse(json["parsely-pub-date"]),
        parselyImageUrl: json["parsely-image-url"],
        parselyAuthor: List<String>.from(json["parsely-author"].map((x) => x)),
        parselySection: json["parsely-section"],
        parselyTags: json["parsely-tags"],
        parselyMetadata: json["parsely-metadata"],
      );

  Map<String, dynamic> toJson() => {
        "parsely-title": parselyTitle,
        "parsely-link": parselyLink,
        "parsely-type": parselyType,
        "parsely-pub-date": parselyPubDate.toIso8601String(),
        "parsely-image-url": parselyImageUrl,
        "parsely-author": List<dynamic>.from(parselyAuthor.map((x) => x)),
        "parsely-section": parselySection,
        "parsely-tags": parselyTags,
        "parsely-metadata": parselyMetadata,
      };
}

class PrimaryCategory {
  PrimaryCategory({
    required this.termId,
    required this.name,
    required this.slug,
    required this.termGroup,
    required this.termTaxonomyId,
    required this.taxonomy,
    required this.description,
    required this.parent,
    required this.count,
    required this.filter,
  });

  int termId;
  String name;
  String slug;
  int termGroup;
  int termTaxonomyId;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;

  factory PrimaryCategory.fromRawJson(String str) =>
      PrimaryCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrimaryCategory.fromJson(Map<String, dynamic> json) =>
      PrimaryCategory(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: json["taxonomy"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: json["filter"],
      );

  Map<String, dynamic> toJson() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "term_group": termGroup,
        "term_taxonomy_id": termTaxonomyId,
        "taxonomy": taxonomy,
        "description": description,
        "parent": parent,
        "count": count,
        "filter": filter,
      };
}

class RapidData {
  RapidData({
    required this.pt,
    required this.pct,
  });

  String pt;
  String pct;

  factory RapidData.fromRawJson(String str) =>
      RapidData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RapidData.fromJson(Map<String, dynamic> json) => RapidData(
        pt: json["pt"],
        pct: json["pct"],
      );

  Map<String, dynamic> toJson() => {
        "pt": pt,
        "pct": pct,
      };
}

class Title {
  Title({
    required this.rendered,
  });

  String rendered;

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}
