import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_data.dart';
import '../core/breakpoints.dart';
import '../core/launch_utils.dart';
import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/coming_soon_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/testimonials_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _openSourceKey = GlobalKey();
  final GlobalKey _writingKey = GlobalKey();

  late final List<String> _navLabels;
  late final List<GlobalKey> _navKeys;

  bool _scrolled = false;
  bool _showBackToTop = false;
  int _activeIndex = -1;

  @override
  void initState() {
    super.initState();
    _navLabels = const ['About', 'Experience', 'Skills', 'Projects', 'Contact'];
    _navKeys = [_aboutKey, _experienceKey, _skillsKey, _projectsKey, _contactKey];
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final scrolled = offset > 24;
    final showBackToTop = offset > 640;

    int newActive = _activeIndex;
    for (int i = 0; i < _navKeys.length; i++) {
      final ctx = _navKeys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject();
      if (box is! RenderBox) continue;
      final position = box.localToGlobal(Offset.zero).dy;
      if (position <= 170) {
        newActive = i;
      }
    }

    if (scrolled != _scrolled || showBackToTop != _showBackToTop || newActive != _activeIndex) {
      setState(() {
        _scrolled = scrolled;
        _showBackToTop = showBackToTop;
        _activeIndex = newActive;
      });
    }
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: Breakpoints.isDesktop(context)
          ? null
          : MobileNavDrawer(
              sectionLabels: _navLabels,
              onNavTap: (i) => _scrollTo(_navKeys[i]),
              onResumeTap: () => LaunchUtils.openUrl(AppData.resumeUrl),
            ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverNavBar(
                sectionLabels: _navLabels,
                onNavTap: (i) => _scrollTo(_navKeys[i]),
                onResumeTap: () => LaunchUtils.openUrl(AppData.resumeUrl),
                onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
                scrolled: _scrolled,
                activeIndex: _activeIndex,
              ),
              SliverToBoxAdapter(
                child: HeroSection(
                  sectionKey: _heroKey,
                  onViewWork: () => _scrollTo(_projectsKey),
                  onContact: () => _scrollTo(_contactKey),
                  onGithub: () => LaunchUtils.openUrl(AppData.githubUrl),
                  onLinkedin: () => LaunchUtils.openUrl(AppData.linkedinUrl),
                  onScrollDown: () => _scrollTo(_aboutKey),
                ),
              ),
              SliverToBoxAdapter(child: AboutSection(sectionKey: _aboutKey)),
              SliverToBoxAdapter(child: ExperienceSection(sectionKey: _experienceKey)),
              SliverToBoxAdapter(child: SkillsSection(sectionKey: _skillsKey)),
              SliverToBoxAdapter(child: ProjectsSection(sectionKey: _projectsKey)),
              // SliverToBoxAdapter(
              //   child: ComingSoonSection(
              //     sectionKey: _openSourceKey,
              //     index: '05',
              //     kicker: 'Open Source',
              //     title: 'Open-source packages',
              //     message:
              //         'Packages published to pub.dev will show up here. Nothing '
              //         'published under this profile yet — check back soon.',
              //     icon: Icons.inventory_2_outlined,
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: ComingSoonSection(
              //     sectionKey: _writingKey,
              //     index: '06',
              //     kicker: 'Writing',
              //     title: 'Technical writing',
              //     message:
              //         'Articles and write-ups on Flutter, Web3, and mobile '
              //         'architecture will show up here. Coming soon.',
              //     icon: Icons.article_outlined,
              //     tint: true,
              //   ),
              // ),
              // SliverToBoxAdapter(child: TestimonialsSection(sectionKey: _testimonialsKey)),
              SliverToBoxAdapter(child: ContactSection(sectionKey: _contactKey)),
              const SliverToBoxAdapter(child: AppFooter()),
            ],
          ),
          Positioned(
            right: 24,
            bottom: 24,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 260),
              offset: _showBackToTop ? Offset.zero : const Offset(0, 1.4),
              curve: Curves.easeOutCubic,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 220),
                opacity: _showBackToTop ? 1 : 0,
                child: _BackToTopButton(onTap: _scrollToTop),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  final VoidCallback onTap;
  const _BackToTopButton({required this.onTap});

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovering ? AppColors.surfaceElevated : AppColors.surface,
            border: Border.all(color: _hovering ? AppColors.accent : AppColors.border),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 18, offset: const Offset(0, 8)),
            ],
          ),
          child: Icon(
            Icons.arrow_upward_rounded,
            color: _hovering ? AppColors.accentBright : AppColors.textSecondary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
