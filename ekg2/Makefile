# $NetBSD: Makefile,v 1.16 2013/11/27 15:41:16 shindenmorr Exp $
#

DISTNAME=	ekg2-0.3.1
PKGREVISION=	1
CATEGORIES=	chat
MASTER_SITES=	http://ekg2.org/
MASTER_SITES+=	http://ekg2.org/archive/
#EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	morr@NetBSD.org
HOMEPAGE=	http://ekg2.org/
COMMENT=	Multiplatform, multiprotocol, plugin-based instant messanger
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes

PKG_DESTDIR_SUPPORT=	destdir
GNU_CONFIGURE=		yes
USE_PKGLOCALEDIR=	yes
USE_NCURSES=		yes
USE_GNU_READLINE=	yes
USE_TOOLS+=		perl gmake
CONFIGURE_ARGS+=	--enable-shared \
			--disable-static \
			--enable-dynamic \
			--without-inotify \
			--without-ioctld \
			--without-gtk \
			--disable-nls \
			--without-libxosd \
			--without-perl \
			--without-python \
			--with-sqlite3 \
			--without-gpg \
			--without-logsoracle \
			--with-readline=${BUILDLINK_PREFIX.readline} \
			--enable-unicode \
			--with-ncurses

.include "options.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/ncursesw/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
