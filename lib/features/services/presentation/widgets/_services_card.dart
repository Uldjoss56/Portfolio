part of '../services_screen.dart';

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({
    required this.serviceData,
  });

  final Map<String, dynamic> serviceData;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.serviceData;
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        width: Responsive.isTablet(context) ? 400 : 300,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: isHover ? orangeTurquois : null,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHover
              ? [
                  primaryColorShadow,
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageAsset(
              data["icon"],
              height: 60,
            ),
            SizedBox(
              height: 3.w,
            ),
            Text(
              data["name"],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 1.w,
            ),
            Text(
              data["description"],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 2.w,
            ),
            if (Responsive.isDesktop(context))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  (data["tool"] as List).length,
                  (index) {
                    final name = data["tool"][index];
                    return Row(
                      children: [
                         Text(
                          '🛠 ',
                          style: GoogleFonts.notoColorEmoji(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          name,
                        ),
                      ],
                    );
                  },
                ),
              ),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: List.generate(
                    (data["tool"] as List).length,
                    (index) {
                      final name = data["tool"][index];
                      return Row(
                        children: [
                           Text(
                            '🛠 ',
                            style: GoogleFonts.notoColorEmoji(
                              fontSize: 20,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              name,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
