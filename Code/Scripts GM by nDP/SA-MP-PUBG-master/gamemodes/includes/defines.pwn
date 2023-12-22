//--------------------------------[DEFINES.PWN]--------------------------------

#define MATCHING_SOLO	0
#define MATCHING_DUO	1
#define MATCHING_SQUAD	2

#define Pressed(%0)	\
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define Holding(%0) \
	((newkeys & (%0)) == (%0))

#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_YELLOW3 0xF0EA92AA

#define TEAM_RED 0xff0000FF
#define TEAM_GREEN 0x0cd802FF
#define TEAM_BLUE 0x02c8ffFF
#define TEAM_YELLOW 0xf7d200FF
#define TEAM_INVISIBLE 0xFFFFFF00