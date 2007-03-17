# $NetBSD: buildlink3.mk,v 1.1 2007/03/17 22:25:16 cosmedbr Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBIXP_BUILDLINK3_MK:=	${LIBIXP_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libixp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibixp}
BUILDLINK_PACKAGES+=	libixp
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libixp

.if ${LIBIXP_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libixp+=	libixp>=0.2nb1
BUILDLINK_PKGSRCDIR.libixp?=	../../wip/libixp
BUILDLINK_DEPMETHOD.libixp?=    build
.endif	# LIBIXP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
