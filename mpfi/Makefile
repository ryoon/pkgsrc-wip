# $NetBSD: Makefile,v 1.3 2015/05/20 22:00:46 alnsn Exp $

DISTNAME=	mpfi-1.5.3
CATEGORIES=	math
MASTER_SITES=	https://gforge.inria.fr/frs/download.php/file/37332/

MAINTAINER=	alnsn@NetBSD.org
HOMEPAGE=	https://gforge.inria.fr/projects/mpfi/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
INFO_FILES=	yes

CONFIGURE_ARGS+=	--infodir=${PREFIX}/${PKGINFODIR}
INSTALLATION_DIRS+=	${PKGINFODIR}

.include "../../math/mpfr/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
