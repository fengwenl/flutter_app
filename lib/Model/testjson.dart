class test {
    int count;
    List<Music> musics;
    int start;
    int total;

    test({this.count, this.musics, this.start, this.total});

    factory test.fromJson(Map<String, dynamic> json) {
        return test(
            count: json['count'],
            musics: json['musics'] != null ? (json['musics'] as List).map((i) => Music.fromJson(i)).toList() : null,
            start: json['start'],
            total: json['total'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['start'] = this.start;
        data['total'] = this.total;
        if (this.musics != null) {
            data['musics'] = this.musics.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Music {
    String alt;
    String alt_title;
    Attrs attrs;
    List<Author> author;
    String id;
    String image;
    String mobile_link;
    Rating rating;
    List<Tag> tags;
    String title;

    Music({this.alt, this.alt_title, this.attrs, this.author, this.id, this.image, this.mobile_link, this.rating, this.tags, this.title});

    factory Music.fromJson(Map<String, dynamic> json) {
        return Music(
            alt: json['alt'],
            alt_title: json['alt_title'],
            attrs: json['attrs'] != null ? Attrs.fromJson(json['attrs']) : null,
            author: json['author'] != null ? (json['author'] as List).map((i) => Author.fromJson(i)).toList() : null,
            id: json['id'],
            image: json['image'],
            mobile_link: json['mobile_link'],
            rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
            tags: json['tags'] != null ? (json['tags'] as List).map((i) => Tag.fromJson(i)).toList() : null,
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alt'] = this.alt;
        data['alt_title'] = this.alt_title;
        data['id'] = this.id;
        data['image'] = this.image;
        data['mobile_link'] = this.mobile_link;
        data['title'] = this.title;
        if (this.attrs != null) {
            data['attrs'] = this.attrs.toJson();
        }
        if (this.author != null) {
            data['author'] = this.author.map((v) => v.toJson()).toList();
        }
        if (this.rating != null) {
            data['rating'] = this.rating.toJson();
        }
        if (this.tags != null) {
            data['tags'] = this.tags.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Author {
    String name;

    Author({this.name});

    factory Author.fromJson(Map<String, dynamic> json) {
        return Author(
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        return data;
    }
}

class Rating {
    String average;
    int max;
    int min;
    int numRaters;

    Rating({this.average, this.max, this.min, this.numRaters});

    factory Rating.fromJson(Map<String, dynamic> json) {
        return Rating(
            average: json['average'],
            max: json['max'],
            min: json['min'],
            numRaters: json['numRaters'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['average'] = this.average;
        data['max'] = this.max;
        data['min'] = this.min;
        data['numRaters'] = this.numRaters;
        return data;
    }
}

class Attrs {
    List<String> discs;
    List<String> media;
    List<String> pubdate;
    List<String> publisher;
    List<String> singer;
    List<String> title;
    List<String> tracks;
    List<String> version;

    Attrs({this.discs, this.media, this.pubdate, this.publisher, this.singer, this.title, this.tracks, this.version});

    factory Attrs.fromJson(Map<String, dynamic> json) {
        return Attrs(
            discs: json['discs'] != null ? new List<String>.from(json['discs']) : null,
            media: json['media'] != null ? new List<String>.from(json['media']) : null,
            pubdate: json['pubdate'] != null ? new List<String>.from(json['pubdate']) : null,
            publisher: json['publisher'] != null ? new List<String>.from(json['publisher']) : null,
            singer: json['singer'] != null ? new List<String>.from(json['singer']) : null,
            title: json['title'] != null ? new List<String>.from(json['title']) : null,
            tracks: json['tracks'] != null ? new List<String>.from(json['tracks']) : null,
            version: json['version'] != null ? new List<String>.from(json['version']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.discs != null) {
            data['discs'] = this.discs;
        }
        if (this.media != null) {
            data['media'] = this.media;
        }
        if (this.pubdate != null) {
            data['pubdate'] = this.pubdate;
        }
        if (this.publisher != null) {
            data['publisher'] = this.publisher;
        }
        if (this.singer != null) {
            data['singer'] = this.singer;
        }
        if (this.title != null) {
            data['title'] = this.title;
        }
        if (this.tracks != null) {
            data['tracks'] = this.tracks;
        }
        if (this.version != null) {
            data['version'] = this.version;
        }
        return data;
    }
}

class Tag {
    int count;
    String name;

    Tag({this.count, this.name});

    factory Tag.fromJson(Map<String, dynamic> json) {
        return Tag(
            count: json['count'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['name'] = this.name;
        return data;
    }
}