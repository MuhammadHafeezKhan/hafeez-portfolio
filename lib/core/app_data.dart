import 'package:flutter/material.dart';
import '../models/experience_item.dart';
import '../models/project.dart';
import '../models/skill_item.dart';
import '../models/testimonial.dart';

/// Single source of truth for every piece of content on the site.
///
/// This is the ONLY file you should need to touch to:
///   - update personal/contact info
///   - add, edit, or remove a project
///   - update experience, skills, or testimonials
///
/// Nothing else in the app hardcodes this content.
class AppData {
  AppData._();

  // ---------------------------------------------------------------------
  // Identity
  // ---------------------------------------------------------------------
  static const String name = 'Hafeez Khan';
  static const String initials = 'HK';
  static const String title = 'Senior Flutter Developer & Team Lead';
  static const String tagline =
      'I build production-ready Flutter apps for iOS and Android — '
      'from pixel-perfect UI to Web3, real-time systems, and payments.';
  static const String location = 'Lahore, Pakistan';
  static const String email = 'hafeez8759@gmail.com';
  static const String phone = '+92 324 4434913';
  static const String whatsappNumber = '923244434913';
  static const String yearsExperience = '5+';

  static const String githubUrl = 'https://github.com/MuhammadHafeezKhan';
  static const String linkedinUrl = 'https://www.linkedin.com/in/hafeezflutter';
  static const String resumeUrl =
      'https://drive.google.com/file/d/1J3FJ9edyTiT1qp0l7pf10XuVUTFkf45q/view?usp=sharing';

  // Placeholder — swap for your real domain once it's ready on Vercel.
  static const String siteUrl = 'https://hafeezkhan.dev';

  static const String aboutParagraph1 =
      "I'm a Senior Flutter Developer and Team Lead with 5+ years of experience "
      "building high-performance, scalable Android and iOS applications. I lead "
      "the architecture and delivery of production Flutter apps, mentor other "
      "developers, and drive technical decisions across every project I touch.";
  static const String aboutParagraph2 =
      "My work spans real-time systems, Web3 integrations, secure payments, and "
      "polished, pixel-perfect UI — turning Figma designs into apps that ship "
      "reliably and hold up under real users. I care about clean architecture, "
      "maintainable code, and building things that are actually pleasant to use.";

  static const List<String> aboutFocusAreas = [
    'Cross-platform Flutter apps (iOS & Android)',
    'Web3 — WalletConnect, Web3Auth, blockchain wallets',
    'Real-time systems — WebSockets, Socket.io, Agora, Zego Cloud',
    'Payments & subscriptions — Stripe, in-app purchases',
    'Firebase, REST APIs, MySQL & clean architecture',
    'Team leadership, mentoring & code review',
  ];

  // ---------------------------------------------------------------------
  // Experience
  // ---------------------------------------------------------------------
  static const List<ExperienceItem> experience = [
    ExperienceItem(
      role: 'Senior Flutter Developer | Team Lead',
      company: 'Code Encoders',
      period: 'Dec 2023 — Present',
      isCurrent: true,
      summary:
          'Leading the development of scalable cross-platform mobile applications '
          'while mentoring developers and driving technical decisions.',
      highlights: [
        'Led the architecture and development of production-ready Flutter applications for Android and iOS.',
        'Integrated Web3 technologies using WalletConnect, Web3Auth, blockchain wallets, and smart contracts.',
        'Built secure authentication, onboarding, and payment workflows for modern mobile applications.',
        'Developed real-time messaging systems using WebSockets and Socket.io.',
        'Implemented high-quality video and voice calling using Agora and Zego Cloud.',
        'Integrated Google Maps, geolocation, QR scanning, deep linking, and location-based services.',
        'Developed subscription and payment solutions using Stripe and in-app purchases.',
        'Optimized application performance, reduced crashes, and improved scalability across multiple projects.',
        'Mentored junior Flutter developers, performed code reviews, and maintained clean architecture and development standards.',
      ],
    ),
    ExperienceItem(
      role: 'Senior Flutter Developer',
      company: 'Rex Technologies',
      period: 'Nov 2020 — Nov 2023',
      summary:
          'Worked on multiple production applications from concept to deployment, '
          'delivering reliable and scalable mobile solutions.',
      highlights: [
        'Built and maintained multiple Flutter applications for Android and iOS across different industries.',
        'Converted Figma and Adobe XD designs into pixel-perfect, responsive user interfaces.',
        'Integrated REST APIs, Firebase, MySQL, push notifications, and third-party SDKs.',
        'Implemented secure payment gateways including Stripe and banking API integrations.',
        'Improved application performance, stability, and maintainability by resolving production issues.',
        'Developed reusable components and scalable application architecture for faster development.',
        'Published and maintained applications on Google Play Store and Apple App Store.',
      ],
    ),
  ];

  // ---------------------------------------------------------------------
  // Skills
  // ---------------------------------------------------------------------
  static const List<RatedSkill> ratedSkills = [
    RatedSkill(name: 'Flutter', value: 0.95),
    RatedSkill(name: 'Dart', value: 0.9),
    RatedSkill(name: 'State Management (GetX, Provider, Bloc)', value: 0.85),
    RatedSkill(name: 'REST API Integration', value: 1.0),
    RatedSkill(name: 'Firebase', value: 0.9),
    RatedSkill(name: 'Web3 (WalletConnect, Web3Auth)', value: 0.75),
    RatedSkill(name: 'Real-time (Sockets, Agora, Zego)', value: 0.8),
    RatedSkill(name: 'Payments & Subscriptions', value: 0.85),
    RatedSkill(name: 'Clean Architecture', value: 0.85),
    RatedSkill(name: 'App Performance Optimization', value: 0.8),
    RatedSkill(name: 'Team Leadership & Mentoring', value: 0.85),
    RatedSkill(name: 'CI/CD & App Store Deployment', value: 0.85),
  ];

  static const List<TechItem> techStack = [
    TechItem(name: 'Flutter', category: 'Core', image: 'assets/skills/skills-flutter.png'),
    TechItem(name: 'Dart', category: 'Core', image: 'assets/skills/skills-dart.webp'),
    TechItem(name: 'Firebase', category: 'Core', image: 'assets/skills/skills-firebase.png'),
    TechItem(name: 'Git', category: 'Core', image: 'assets/skills/skills-git.png'),
    TechItem(name: 'Figma', category: 'Core', image: 'assets/skills/skills-figma.png'),
    TechItem(name: 'Android Studio', category: 'Core', image: 'assets/skills/skills-android-studio.webp'),
    TechItem(name: 'Google Maps', category: 'Real-time & Integrations', image: 'assets/skills/skills-google-map.png'),
    TechItem(name: 'Socket.io', category: 'Real-time & Integrations', image: 'assets/skills/skills-socket.png'),
    TechItem(name: 'WebSockets', category: 'Real-time & Integrations', icon: Icons.sync_alt_outlined),
    TechItem(name: 'Agora', category: 'Real-time & Integrations', icon: Icons.videocam_outlined),
    TechItem(name: 'Zego Cloud', category: 'Real-time & Integrations', icon: Icons.call_outlined),
    TechItem(name: 'Push Notifications', category: 'Real-time & Integrations', image: 'assets/skills/skills-push-notification.png'),
    TechItem(name: 'Deep Linking', category: 'Real-time & Integrations', icon: Icons.link_outlined),
    TechItem(name: 'QR Scanning', category: 'Real-time & Integrations', icon: Icons.qr_code_scanner_outlined),
    TechItem(name: 'Stripe', category: 'Payments & Web3', image: 'assets/skills/skills-stripe.png'),
    TechItem(name: 'In-App Purchases', category: 'Payments & Web3', image: 'assets/skills/skills-revenue-cat.png'),
    TechItem(name: 'Blockchain', category: 'Payments & Web3', image: 'assets/skills/skills-blockchain.png'),
    TechItem(name: 'WalletConnect', category: 'Payments & Web3', icon: Icons.account_balance_wallet_outlined),
    TechItem(name: 'KYC', category: 'Payments & Web3', image: 'assets/skills/skills-kyc.png'),
    TechItem(name: 'REST APIs', category: 'Data & Tooling', icon: Icons.api_outlined),
    TechItem(name: 'MySQL', category: 'Data & Tooling', icon: Icons.storage_outlined),
    TechItem(name: 'TanStack Query', category: 'Data & Tooling', image: 'assets/skills/skills-tanstack.png'),
    TechItem(name: 'Local Storage', category: 'Data & Tooling', image: 'assets/skills/skills-shared-prefrences.png'),
    TechItem(name: 'State Management', category: 'Data & Tooling', image: 'assets/skills/skills-redux.png'),
    TechItem(name: 'Social Login', category: 'Data & Tooling', image: 'assets/skills/skills-social-login.png'),
    TechItem(name: 'App Store', category: 'Deployment', image: 'assets/skills/skills-app-store.png'),
    TechItem(name: 'Play Store', category: 'Deployment', image: 'assets/skills/skills-play-store.png'),
  ];

  // ---------------------------------------------------------------------
  // Projects — add / edit / remove entries here only.
  // ---------------------------------------------------------------------
  static const List<Project> projects = [
    Project(
      name: 'On Scene',
      image: 'assets/projects/project_onscene.png',
      category: 'Venue social app',
      role: 'Location feature lead',
      impact: 'Maps + live discovery',
      isFeatured: true,
      description:
          'A location-aware social platform bridging digital discovery and '
          'real-world connections. I engineered a seamless check-in mechanism '
          'using the Google Maps API, letting users discover and interact with '
          'others at nearby venues in real time.',
      techs: ['Flutter', 'Google Maps', 'Socket.io', 'RevenueCat', 'Firebase'],
      highlights: [
        'Designed check-in flows around nearby venues and live user presence.',
        'Connected Google Maps, sockets, and Firebase into one discovery path.',
        'Supported paid experiences with RevenueCat subscriptions.',
      ],
    ),
    Project(
      name: 'LawnOlu',
      image: 'assets/projects/project_lawnolu.png',
      category: 'Service marketplace',
      role: 'Mobile app engineer',
      impact: 'Live tracking + payments',
      isFeatured: true,
      description:
          'A high-performance service-provider application built on REST APIs '
          'and Firebase. Its architecture supports multi-tenant logic, letting '
          'users switch between business roles seamlessly, with real-time job '
          'tracking via Google Maps and secure payments through Stripe.',
      techs: ['Flutter', 'REST API', 'Google Maps', 'Stripe', 'Socket.io'],
      highlights: [
        'Built multi-role service flows for customers and providers.',
        'Added Google Maps tracking for active service jobs.',
        'Integrated Stripe payments and Firebase analytics/notifications.',
      ],
    ),
    Project(
      name: 'Zera',
      image: 'assets/projects/project_zera.png',
      category: 'Data-heavy app',
      role: 'Feature developer',
      impact: 'Heatmaps + QR workflows',
      isFeatured: true,
      description:
          'A cross-functional app built on REST APIs and TanStack-style query '
          'patterns for robust caching. I implemented custom heatmaps for data '
          'visualization, QR scanning for fast interactions, and in-app web '
          'views for extended functionality.',
      techs: ['Flutter', 'REST API', 'TanStack Query', 'Google Maps', 'QR Scanner'],
      highlights: [
        'Implemented custom heatmap views for location-based insights.',
        'Used TanStack-style caching for predictable API state.',
        'Added QR scanning and in-app web views for fast task completion.',
      ],
    ),
    Project(
      name: 'Paw Play Love',
      image: 'assets/projects/project_ppl.png',
      category: 'Social product',
      role: 'Flutter developer',
      impact: 'Subscriptions + real-time community',
      androidLink: 'https://play.google.com/store/apps/details?id=com.pawplaylove&hl=en',
      iosLink: 'https://apps.apple.com/id/app/paw-play-love/id6648773545',
      description:
          'A community-driven platform connecting pet owners through meaningful '
          'social interactions. I integrated Firebase Auth and notifications, '
          'real-time communication over sockets, and RevenueCat for in-app '
          'purchases and subscriptions.',
      techs: ['Flutter', 'Firebase', 'Socket.io', 'RevenueCat', 'Provider'],
      highlights: [
        'Built live social interactions with socket-driven updates.',
        'Integrated RevenueCat for in-app purchases and subscriptions.',
        'Implemented Firebase auth, notifications, and cached media flows.',
      ],
    ),
    Project(
      name: 'BePay Client',
      image: 'assets/projects/project_bepay_client.png',
      category: 'Web3 commerce',
      role: 'Consumer app developer',
      impact: 'Wallet onboarding + KYC',
      description:
          'A Web3-integrated consumer platform focused on a seamless transition '
          'between traditional and decentralized commerce, featuring secure '
          'wallet creation via WalletConnect/Web3Auth and OAuth-based login.',
      techs: ['Flutter', 'Web3Auth', 'WalletConnect', 'Blockchain', 'KYC'],
      highlights: [
        'Built wallet creation and OAuth onboarding with Web3Auth.',
        'Connected traditional REST flows with blockchain-backed commerce.',
        'Supported identity checks through KYC-oriented screens.',
      ],
    ),
    Project(
      name: 'BePay Business',
      image: 'assets/projects/project_bepay_business.png',
      category: 'Merchant platform',
      role: 'Business app developer',
      impact: 'KYB + order operations',
      description:
          'A dedicated Flutter application for business owners and service '
          'providers within the Web3 ecosystem, managing KYB verification '
          'flows alongside product listing and order management tools.',
      techs: ['Flutter', 'Blockchain', 'KYB', 'REST API', 'Provider'],
      highlights: [
        'Created merchant-facing product, listing, and order tools.',
        'Implemented KYB verification flows for business onboarding.',
        'Used Provider to manage operational state across complex screens.',
      ],
    ),
    Project(
      name: 'Simman',
      image: 'assets/projects/project_simman.png',
      category: 'Audio platform',
      role: 'Realtime systems developer',
      impact: 'Low-latency streaming UX',
      description:
          'Real-time audio streaming built on an architecture that balances '
          'speed with security. I used Firebase Realtime Database for live '
          'updates and structured state management to keep the app responsive '
          'under heavy data loads.',
      techs: ['Flutter', 'Firebase Realtime DB', 'Audio Streaming', 'GetX'],
      highlights: [
        'Built responsive audio-streaming screens with live state updates.',
        'Used Firebase Realtime Database for fast synchronization.',
        'Structured GetX state flows around heavy realtime data.',
      ],
    ),
    Project(
      name: 'Jatt App',
      image: 'assets/projects/project_jatt.png',
      category: 'Social app',
      role: 'Flutter developer',
      impact: 'Auth + engagement foundation',
      description:
          'A social app focused on polished onboarding, authenticated API '
          'flows, and Firebase-backed user engagement features.',
      techs: ['Flutter', 'REST API', 'Firebase', 'Social Login'],
      highlights: [
        'Built social login and authenticated REST API flows.',
        'Connected Firebase services for app engagement features.',
        'Focused on a clean mobile UI foundation for future expansion.',
      ],
    ),
  ];

  // ---------------------------------------------------------------------
  // Testimonials — styled placeholder until real ones are added.
  // ---------------------------------------------------------------------
  static const List<Testimonial> testimonials = [
    Testimonial(
      name: 'Your next client',
      role: 'Testimonials coming soon',
      quote:
          'This space is reserved for feedback from clients and teammates. '
          'Real testimonials will appear here soon.',
    ),
  ];
  static const bool testimonialsArePlaceholder = true;

  // ---------------------------------------------------------------------
  // Open Source & Writing — kept structurally ready, empty for now.
  // ---------------------------------------------------------------------
  static const List<String> openSourcePackages = [];
  static const List<String> writingPosts = [];
}
