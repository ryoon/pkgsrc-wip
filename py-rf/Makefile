# $NetBSD$

DISTNAME=	rf-0.1.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=r/rf/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://files.pythonhosted.org/packages/source/r/rf/
COMMENT=	Receiver function calculation in seismology
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-geographiclib>=1.31:../../wip/py-geographiclib
DEPENDS+=	${PYPKGPREFIX}-obspy>=0.8.4:../../geography/py-obspy
DEPENDS+=	${PYPKGPREFIX}-toeplitz>=0.1.2:../../wip/py-toeplitz

USE_LANGUAGES=	c fortran

.include "../../lang/python/egg.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
