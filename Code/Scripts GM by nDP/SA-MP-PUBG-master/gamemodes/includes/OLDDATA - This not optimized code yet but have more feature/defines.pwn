//--------------------------------[DEFINES.PWN]--------------------------------

native WP_Hash(buffer[], len, const str[]);

// ใช้มาโคร Key
#define Pressed(%0)	\
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define Holding(%0) \
	((newkeys & (%0)) == (%0))

#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

/* ----------------- BIT OPERATORS ------------------ */
#define BitFlag_Get(%0,%1) ((%0) & (%1))  
#define BitFlag_On(%0,%1) ((%0) |= (%1)) 
#define BitFlag_Off(%0,%1) ((%0) &= ~(%1))
#define BitFlag_Toggle(%0,%1) ((%0) ^= (%1))

/* ----------------- COLOR -------------------------- */
#define COLOR_YELLOW 0xFFE104FF

#define CIRCLEDATA_WHITETIME 	0
#define CIRCLEDATA_SIZE 		1
#define CIRCLEDATA_BLUETIME 	2

#define TEAM_RED 0xff0000FF
#define TEAM_GREEN 0x0cd802FF
#define TEAM_BLUE 0x02c8ffFF
#define TEAM_YELLOW 0xf7d200FF
#define TEAM_INVISIBLE 0xFFFFFF00

#define DEATH_PLAYZONE 55

#define LOBBY	5000
#define PARTY	4000


enum {
	MATCHING_SOLO,
	MATCHING_DUO,
	MATCHING_SQUAD,
	//MATCHING_ONESQUAD,
};
