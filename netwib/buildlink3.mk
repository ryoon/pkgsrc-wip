# $NetBSD: buildlink3.mk,v 1.2 2004/05/26 20:28:01 adrian_p Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NETWIB_BUILDLINK3_MK:=	${NETWIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	netwib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnetwib}
BUILDLINK_PACKAGES+=	netwib

.if !empty(NETWIB_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.netwib+=	netwib>=5.16.0
BUILDLINK_PKGSRCDIR.netwib?=	../../wip/netwib
.endif	# NETWIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
