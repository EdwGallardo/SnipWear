import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ca', 'en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? caText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [caText, enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // b_MenuPrincipal
  {
    'nvqtswb5': {
      'ca': 'Pàgina Principal',
      'en': 'Home',
      'es': 'Página Inicial',
    },
  },
  // a_Login
  {
    'ptog0w5g': {
      'ca': 'Benvinguts a SnipWear',
      'en': 'Welcome to SnipWear',
      'es': 'Bienvenidos a SnipWear',
    },
    'z3ktsrw3': {
      'ca': 'Inicia la teva sessió per continuar.',
      'en': 'Please log in to continue.',
      'es': 'Inicia tu sesión para continuar.',
    },
    'ppwg7zc2': {
      'ca': 'E-mail',
      'en': 'E-mail',
      'es': 'E-mail',
    },
    'kidqn15q': {
      'ca': 'example@example.com',
      'en': 'example@example.com',
      'es': 'example@example.com',
    },
    'yte338ez': {
      'ca': 'Contrasenya',
      'en': 'Password',
      'es': 'Contraseña',
    },
    'q8gk0gmu': {
      'ca': '**********',
      'en': '**********************',
      'es': '*******************',
    },
    'y898qrh2': {
      'ca': 'Iniciar sessió',
      'en': 'Log on',
      'es': 'Iniciar sesión',
    },
    'gsr0u0v3': {
      'ca': 'O',
      'en': 'O',
      'es': 'O',
    },
    '9z7veeoc': {
      'ca': 'Iniciar amb Google',
      'en': 'Start with Google',
      'es': 'Iniciar con Google',
    },
    'u8mjblg2': {
      'ca': 'Iniciar amb Apple',
      'en': 'Start with Apple',
      'es': 'Iniciar con Apple',
    },
    'd9ov790t': {
      'ca': 'Encara no tens un compte? ',
      'en': 'Don\'t have an account yet?',
      'es': '¿Aún no tienes una cuenta?',
    },
    '0c0myue6': {
      'ca': 'Registra\'t',
      'en': 'Sign up',
      'es': 'Regístrate',
    },
    '2n16odkx': {
      'ca': 'UserName',
      'en': 'UserName',
      'es': 'UserName',
    },
    '6qsef2qn': {
      'ca': 'Overall',
      'en': 'overall',
      'es': 'Overall',
    },
    'ky8pgryz': {
      'ca': '5',
      'en': '5',
      'es': '5',
    },
    'm46ecwoy': {
      'ca':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Nice outdoor courts, sólido concreto and good hoops for the neighborhood.',
    },
    'vohi97qy': {
      'ca': 'Home',
      'en': 'man',
      'es': 'Hombre',
    },
  },
  // ConfiguracionsUsuari
  {
    'umw65rz0': {
      'ca': 'Nom',
      'en': 'First name',
      'es': 'Nombre',
    },
    'b675a28j': {
      'ca': 'Nom',
      'en': 'First name',
      'es': 'Nombre',
    },
    '4jw0gs6w': {
      'ca': 'Cognom',
      'en': 'Surname',
      'es': 'Apellido',
    },
    '8xmnp6p0': {
      'ca': 'Cognom',
      'en': 'Surname',
      'es': 'Apellido',
    },
    'vvm6iwc5': {
      'ca': 'E-mail',
      'en': 'E-mail',
      'es': 'E-mail',
    },
    '8ww483gq': {
      'ca': 'example@example.com',
      'en': 'example@example.com',
      'es': 'example@example.com',
    },
    'rxuzrz1x': {
      'ca': 'Nova contrasenya',
      'en': 'New password',
      'es': 'Nueva contraseña',
    },
    '9abu3bz7': {
      'ca': '************************',
      'en': '************************',
      'es': '************************',
    },
    '1nbnelz0': {
      'ca': 'Confirma la nova contrasenya',
      'en': 'Confirm the new password',
      'es': 'Confirma la nueva contraseña',
    },
    'oa941ygf': {
      'ca': '************************',
      'en': '**************************',
      'es': '************************',
    },
    'vb582pzl': {
      'ca': 'Language / Idioma',
      'en': 'Language',
      'es': 'Language / Idioma',
    },
    'trzhb804': {
      'ca': 'CAT',
      'en': 'CAT',
      'es': 'CAT',
    },
    'f3s0vnnm': {
      'ca': 'ESP',
      'en': 'ESP',
      'es': 'ESP',
    },
    '6ph571pn': {
      'ca': 'ENG',
      'en': 'ENG',
      'es': 'ENG',
    },
    'nt6bsc1r': {
      'ca': 'Guardar canvis',
      'en': 'Save changes',
      'es': 'Guardar cambios',
    },
    '775mjxl3': {
      'ca': 'Tancar sessió',
      'en': 'Sign out',
      'es': 'Cerrar sesión',
    },
    '3z2xqyxk': {
      'ca': 'Pàgina principal',
      'en': 'Main page',
      'es': 'Página principal',
    },
  },
  // DiscountSelector
  {
    'jnvvgoky': {
      'ca': 'Rankings',
      'en': 'Rankings',
      'es': 'Rankings',
    },
    'kztpys8p': {
      'ca': 'Percentatge mínim de descompte',
      'en': 'Minimum discount percentage',
      'es': 'Porcentaje mínimo de descuento',
    },
    '21y59p07': {
      'ca': 'Altres ofertes',
      'en': 'Other offers',
      'es': 'Otras ofertas',
    },
    'bqhnm1ru': {
      'ca': 'Pàgina principal',
      'en': 'Main page',
      'es': 'Página principal',
    },
  },
  // VeureDescompte
  {
    '723l3y6m': {
      'ca': 'Data final: ',
      'en': 'End date:',
      'es': 'Fecha final:',
    },
    'r7jm18wp': {
      'ca': 'Tipus:',
      'en': 'Type:',
      'es': 'Tipo:',
    },
    '9aqjauqh': {
      'ca': 'Pàgina principal',
      'en': 'Main page',
      'es': 'Página principal',
    },
  },
  // Ranking
  {
    'uaq7bvbo': {
      'ca': 'Pàgina principal',
      'en': 'Main page',
      'es': 'Página principal',
    },
  },
  // PujarDescompte
  {
    'bbwr7dgm': {
      'ca': 'Nom de la botiga',
      'en': 'Store Name',
      'es': 'Nombre de la tienda',
    },
    'yz7bwwzr': {
      'ca': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Search for an item...',
    },
    '1roige69': {
      'ca': 'Descripció',
      'en': 'Description',
      'es': 'Descripción',
    },
    'h166gvyt': {
      'ca': 'Descripció de l\'oferta',
      'en': 'Description of the offer',
      'es': 'Descripción de la oferta',
    },
    '67jwtnha': {
      'ca': 'Tipus ofertes',
      'en': 'Types of offers',
      'es': 'Tipo ofertas',
    },
    'ktfk6sqo': {
      'ca': 'Option 1',
      'en': 'Option 1',
      'es': 'Option 1',
    },
    'wpwfof0s': {
      'ca': 'Please select...',
      'en': 'Please select...',
      'es': 'Please select...',
    },
    'd259vtdw': {
      'ca': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Search for an item...',
    },
    'c3pi0ma0': {
      'ca': 'Percentatge descompte',
      'en': 'Discount percentage',
      'es': 'Porcentaje descuento',
    },
    'vgjj537d': {
      'ca': 'Pujar\n',
      'en': 'Upload',
      'es': 'Subir',
    },
    'eto3k6wg': {
      'ca': 'Pàgina principal',
      'en': 'Main page',
      'es': 'Página principal',
    },
  },
  // a_Registre
  {
    'v5hcs261': {
      'ca': 'Crea un compte',
      'en': 'Create an account',
      'es': 'Crear una cuenta',
    },
    'k6xxmmu5': {
      'ca': 'Ompleix les següents dades:',
      'en': 'Fill in the following information:',
      'es': 'Rellena los siguientes datos:',
    },
    'enomygy5': {
      'ca': 'E-mail',
      'en': 'E-mail',
      'es': 'E-mail',
    },
    '3379fmgr': {
      'ca': 'example@example.com',
      'en': 'example@example.com',
      'es': 'example@example.com',
    },
    'lylb8uc1': {
      'ca': 'Contrasenya',
      'en': 'Password',
      'es': 'Contraseña',
    },
    'r1o14df3': {
      'ca': '**********',
      'en': '**********',
      'es': '**********',
    },
    'b9g3jwef': {
      'ca': 'Confirma la Contrasenya',
      'en': 'Confirm Password',
      'es': 'Confirma la Contraseña',
    },
    'g9f1rhil': {
      'ca': '**********',
      'en': '**********',
      'es': '**********',
    },
    'xum0fn05': {
      'ca': 'Crear nou compte',
      'en': 'Create new account',
      'es': 'Crear nueva cuenta',
    },
    'b9awlmwr': {
      'ca': 'O',
      'en': 'O',
      'es': 'O',
    },
    'ubfbfr5w': {
      'ca': 'Vincular amb Google',
      'en': 'Link with Google',
      'es': 'Vincular con Google',
    },
    'ico3y6uv': {
      'ca': 'Vincular amb Apple',
      'en': 'Link with Apple',
      'es': 'Vincular con Apple',
    },
    't5ukct7v': {
      'ca': 'Usuari',
      'en': 'User',
      'es': 'Usuario',
    },
    'zb73cntd': {
      'ca': 'Overall',
      'en': 'overall',
      'es': 'Overall',
    },
    'dyxo0h07': {
      'ca': '5',
      'en': '5',
      'es': '5',
    },
    'e3zh7sxp': {
      'ca':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Nice outdoor courts, sólido concreto and good hoops for the neighborhood.',
    },
    '69kv3i4t': {
      'ca': 'Home',
      'en': 'man',
      'es': 'Hombre',
    },
  },
  // ShopDetails
  {
    '2j5j7ob7': {
      'ca': 'Pàgina principal',
      'en': 'Home',
      'es': 'Página principal',
    },
  },
  // Miscellaneous
  {
    'prgzgtqn': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'e8doraau': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'yvpgq5sy': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'muec9dq4': {
      'ca':
          'Necessitem accés a la teva camara perque puguis fer les fotos de les promocions que pujes a la nostra app directament des d\'aqui.',
      'en':
          'We need access to your camera so that you can take photos of the promotions that you upload to our app directly from here.',
      'es':
          'Necesitamos acceso a tu cámara para que puedas tomar las fotos de las promociones que subes a nuestra app directamente desde aquí.',
    },
    '9fp32526': {
      'ca':
          'Necessitem accés a la teva localització per poder donarte les promocions més properes a tu quan l\'app está oberta.',
      'en':
          'We need access to your location to be able to give you the promotions closest to you when the app is open.',
      'es':
          'Necesitamos acceso a tu localización para poder darte las promociones más cercanas a ti cuando la app está abierta.',
    },
    '1a2rgcih': {
      'ca':
          'Necessitem accés a les teves notificacions per avisarte quan estas a prop d\'una oferta que ens has dit que et pot interessar.',
      'en':
          'We need access to your notifications to let you know when you\'re close to an offer you\'ve told us you might be interested in.',
      'es':
          'Necesitamos acceso a tus notificaciones para avisarte cuando estás cerca de una oferta que nos has dicho que te puede interesar.',
    },
    's6zjji74': {
      'ca':
          'Necessitem accés a la teva llibreria de fotos perque puguis navegar en la teva galeria i pujar la foto que tu dessitgis.',
      'en':
          'We need access to your photo library so you can browse your gallery and upload the photo you want.',
      'es':
          'Necesitamos acceso a tu librería de fotos para que puedas navegar en tu galería y subir la foto que tú desees.',
    },
    'hvb10y65': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'hbkh36ea': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '6gfrkuqh': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'z1yxahoz': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '5ngqp9w1': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'iq0q1xf7': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'gpyig3pd': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'got6z89p': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'bp07yr1s': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '1vyg34yu': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'tpq5aja8': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '80u4tr7s': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '703v6bxx': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'skp2zsri': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '8a28xr3j': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'znnx56o2': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'jid72aod': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '0g6a4zan': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'imq9ihov': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'urc1qak9': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'w2cwrz1q': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'gml4um2e': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '2listlze': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '7mvof5ke': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'yp68n60r': {
      'ca': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
