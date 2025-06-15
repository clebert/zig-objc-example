const objc = @import("objc.zig");
const String = @import("String.zig");

extern "c" const NLLanguageAmharic: objc.Id;
extern "c" const NLLanguageArabic: objc.Id;
extern "c" const NLLanguageArmenian: objc.Id;
extern "c" const NLLanguageBengali: objc.Id;
extern "c" const NLLanguageBulgarian: objc.Id;
extern "c" const NLLanguageBurmese: objc.Id;
extern "c" const NLLanguageCatalan: objc.Id;
extern "c" const NLLanguageCherokee: objc.Id;
extern "c" const NLLanguageCroatian: objc.Id;
extern "c" const NLLanguageCzech: objc.Id;
extern "c" const NLLanguageDanish: objc.Id;
extern "c" const NLLanguageDutch: objc.Id;
extern "c" const NLLanguageEnglish: objc.Id;
extern "c" const NLLanguageFinnish: objc.Id;
extern "c" const NLLanguageFrench: objc.Id;
extern "c" const NLLanguageGeorgian: objc.Id;
extern "c" const NLLanguageGerman: objc.Id;
extern "c" const NLLanguageGreek: objc.Id;
extern "c" const NLLanguageGujarati: objc.Id;
extern "c" const NLLanguageHebrew: objc.Id;
extern "c" const NLLanguageHindi: objc.Id;
extern "c" const NLLanguageHungarian: objc.Id;
extern "c" const NLLanguageIcelandic: objc.Id;
extern "c" const NLLanguageIndonesian: objc.Id;
extern "c" const NLLanguageItalian: objc.Id;
extern "c" const NLLanguageJapanese: objc.Id;
extern "c" const NLLanguageKannada: objc.Id;
extern "c" const NLLanguageKazakh: objc.Id;
extern "c" const NLLanguageKhmer: objc.Id;
extern "c" const NLLanguageKorean: objc.Id;
extern "c" const NLLanguageLao: objc.Id;
extern "c" const NLLanguageMalay: objc.Id;
extern "c" const NLLanguageMalayalam: objc.Id;
extern "c" const NLLanguageMarathi: objc.Id;
extern "c" const NLLanguageMongolian: objc.Id;
extern "c" const NLLanguageNorwegian: objc.Id;
extern "c" const NLLanguageOriya: objc.Id;
extern "c" const NLLanguagePersian: objc.Id;
extern "c" const NLLanguagePolish: objc.Id;
extern "c" const NLLanguagePortuguese: objc.Id;
extern "c" const NLLanguagePunjabi: objc.Id;
extern "c" const NLLanguageRomanian: objc.Id;
extern "c" const NLLanguageRussian: objc.Id;
extern "c" const NLLanguageSimplifiedChinese: objc.Id;
extern "c" const NLLanguageSinhalese: objc.Id;
extern "c" const NLLanguageSlovak: objc.Id;
extern "c" const NLLanguageSpanish: objc.Id;
extern "c" const NLLanguageSwedish: objc.Id;
extern "c" const NLLanguageTamil: objc.Id;
extern "c" const NLLanguageTelugu: objc.Id;
extern "c" const NLLanguageThai: objc.Id;
extern "c" const NLLanguageTibetan: objc.Id;
extern "c" const NLLanguageTraditionalChinese: objc.Id;
extern "c" const NLLanguageTurkish: objc.Id;
extern "c" const NLLanguageUkrainian: objc.Id;
extern "c" const NLLanguageUrdu: objc.Id;
extern "c" const NLLanguageVietnamese: objc.Id;

pub const Language = enum {
    amharic,
    arabic,
    armenian,
    bengali,
    bulgarian,
    burmese,
    catalan,
    cherokee,
    croatian,
    czech,
    danish,
    dutch,
    english,
    finnish,
    french,
    georgian,
    german,
    greek,
    gujarati,
    hebrew,
    hindi,
    hungarian,
    icelandic,
    indonesian,
    italian,
    japanese,
    kannada,
    kazakh,
    khmer,
    korean,
    lao,
    malay,
    malayalam,
    marathi,
    mongolian,
    norwegian,
    oriya,
    persian,
    polish,
    portuguese,
    punjabi,
    romanian,
    russian,
    simplified_chinese,
    sinhalese,
    slovak,
    spanish,
    swedish,
    tamil,
    telugu,
    thai,
    tibetan,
    traditional_chinese,
    turkish,
    ukrainian,
    urdu,
    vietnamese,

    pub fn getInstance(self: Language) objc.Id {
        return switch (self) {
            .amharic => NLLanguageAmharic,
            .arabic => NLLanguageArabic,
            .armenian => NLLanguageArmenian,
            .bengali => NLLanguageBengali,
            .bulgarian => NLLanguageBulgarian,
            .burmese => NLLanguageBurmese,
            .catalan => NLLanguageCatalan,
            .cherokee => NLLanguageCherokee,
            .croatian => NLLanguageCroatian,
            .czech => NLLanguageCzech,
            .danish => NLLanguageDanish,
            .dutch => NLLanguageDutch,
            .english => NLLanguageEnglish,
            .finnish => NLLanguageFinnish,
            .french => NLLanguageFrench,
            .georgian => NLLanguageGeorgian,
            .german => NLLanguageGerman,
            .greek => NLLanguageGreek,
            .gujarati => NLLanguageGujarati,
            .hebrew => NLLanguageHebrew,
            .hindi => NLLanguageHindi,
            .hungarian => NLLanguageHungarian,
            .icelandic => NLLanguageIcelandic,
            .indonesian => NLLanguageIndonesian,
            .italian => NLLanguageItalian,
            .japanese => NLLanguageJapanese,
            .kannada => NLLanguageKannada,
            .kazakh => NLLanguageKazakh,
            .khmer => NLLanguageKhmer,
            .korean => NLLanguageKorean,
            .lao => NLLanguageLao,
            .malay => NLLanguageMalay,
            .malayalam => NLLanguageMalayalam,
            .marathi => NLLanguageMarathi,
            .mongolian => NLLanguageMongolian,
            .norwegian => NLLanguageNorwegian,
            .oriya => NLLanguageOriya,
            .persian => NLLanguagePersian,
            .polish => NLLanguagePolish,
            .portuguese => NLLanguagePortuguese,
            .punjabi => NLLanguagePunjabi,
            .romanian => NLLanguageRomanian,
            .russian => NLLanguageRussian,
            .simplified_chinese => NLLanguageSimplifiedChinese,
            .sinhalese => NLLanguageSinhalese,
            .slovak => NLLanguageSlovak,
            .spanish => NLLanguageSpanish,
            .swedish => NLLanguageSwedish,
            .tamil => NLLanguageTamil,
            .telugu => NLLanguageTelugu,
            .thai => NLLanguageThai,
            .tibetan => NLLanguageTibetan,
            .traditional_chinese => NLLanguageTraditionalChinese,
            .turkish => NLLanguageTurkish,
            .ukrainian => NLLanguageUkrainian,
            .urdu => NLLanguageUrdu,
            .vietnamese => NLLanguageVietnamese,
        };
    }

    pub fn fromInstance(instance: objc.Id) ?Language {
        if (instance == NLLanguageAmharic) {
            return .amharic;
        }

        if (instance == NLLanguageArabic) {
            return .arabic;
        }

        if (instance == NLLanguageArmenian) {
            return .armenian;
        }

        if (instance == NLLanguageBengali) {
            return .bengali;
        }

        if (instance == NLLanguageBulgarian) {
            return .bulgarian;
        }

        if (instance == NLLanguageBurmese) {
            return .burmese;
        }

        if (instance == NLLanguageCatalan) {
            return .catalan;
        }

        if (instance == NLLanguageCherokee) {
            return .cherokee;
        }

        if (instance == NLLanguageCroatian) {
            return .croatian;
        }

        if (instance == NLLanguageCzech) {
            return .czech;
        }

        if (instance == NLLanguageDanish) {
            return .danish;
        }

        if (instance == NLLanguageDutch) {
            return .dutch;
        }

        if (instance == NLLanguageEnglish) {
            return .english;
        }

        if (instance == NLLanguageFinnish) {
            return .finnish;
        }

        if (instance == NLLanguageFrench) {
            return .french;
        }

        if (instance == NLLanguageGeorgian) {
            return .georgian;
        }

        if (instance == NLLanguageGerman) {
            return .german;
        }

        if (instance == NLLanguageGreek) {
            return .greek;
        }

        if (instance == NLLanguageGujarati) {
            return .gujarati;
        }

        if (instance == NLLanguageHebrew) {
            return .hebrew;
        }

        if (instance == NLLanguageHindi) {
            return .hindi;
        }

        if (instance == NLLanguageHungarian) {
            return .hungarian;
        }

        if (instance == NLLanguageIcelandic) {
            return .icelandic;
        }

        if (instance == NLLanguageIndonesian) {
            return .indonesian;
        }

        if (instance == NLLanguageItalian) {
            return .italian;
        }

        if (instance == NLLanguageJapanese) {
            return .japanese;
        }

        if (instance == NLLanguageKannada) {
            return .kannada;
        }

        if (instance == NLLanguageKazakh) {
            return .kazakh;
        }

        if (instance == NLLanguageKhmer) {
            return .khmer;
        }

        if (instance == NLLanguageKorean) {
            return .korean;
        }

        if (instance == NLLanguageLao) {
            return .lao;
        }

        if (instance == NLLanguageMalay) {
            return .malay;
        }

        if (instance == NLLanguageMalayalam) {
            return .malayalam;
        }

        if (instance == NLLanguageMarathi) {
            return .marathi;
        }

        if (instance == NLLanguageMongolian) {
            return .mongolian;
        }

        if (instance == NLLanguageNorwegian) {
            return .norwegian;
        }

        if (instance == NLLanguageOriya) {
            return .oriya;
        }

        if (instance == NLLanguagePersian) {
            return .persian;
        }

        if (instance == NLLanguagePolish) {
            return .polish;
        }

        if (instance == NLLanguagePortuguese) {
            return .portuguese;
        }

        if (instance == NLLanguagePunjabi) {
            return .punjabi;
        }

        if (instance == NLLanguageRomanian) {
            return .romanian;
        }

        if (instance == NLLanguageRussian) {
            return .russian;
        }

        if (instance == NLLanguageSimplifiedChinese) {
            return .simplified_chinese;
        }

        if (instance == NLLanguageSinhalese) {
            return .sinhalese;
        }

        if (instance == NLLanguageSlovak) {
            return .slovak;
        }

        if (instance == NLLanguageSpanish) {
            return .spanish;
        }

        if (instance == NLLanguageSwedish) {
            return .swedish;
        }

        if (instance == NLLanguageTamil) {
            return .tamil;
        }

        if (instance == NLLanguageTelugu) {
            return .telugu;
        }

        if (instance == NLLanguageThai) {
            return .thai;
        }

        if (instance == NLLanguageTibetan) {
            return .tibetan;
        }

        if (instance == NLLanguageTraditionalChinese) {
            return .traditional_chinese;
        }

        if (instance == NLLanguageTurkish) {
            return .turkish;
        }

        if (instance == NLLanguageUkrainian) {
            return .ukrainian;
        }

        if (instance == NLLanguageUrdu) {
            return .urdu;
        }

        if (instance == NLLanguageVietnamese) {
            return .vietnamese;
        }

        return null;
    }

    pub fn recognize(input: String) !?Language {
        return fromInstance(objc.sendMessage(
            try objc.getClass("NLLanguageRecognizer"),
            "dominantLanguageForString:",
            .{input.instance},
            objc.Id,
        ));
    }
};
