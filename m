Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 92741529A1
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 20:00:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AK05GZ017642;
	Wed, 10 Oct 2012 15:00:05 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AK05lM005500;
	Wed, 10 Oct 2012 15:00:05 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 15:00:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] qt4-embedded-gles: Port
	qt4-embedded-gles	recipe from oe-classic
Thread-Index: AQHNpxz27ytX5vP6QUuRV8CPpPEcF5ey8guA
Date: Wed, 10 Oct 2012 20:00:04 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592574D0@DLEE12.ent.ti.com>
References: <1349898901-32630-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349898901-32630-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 1/2] qt4-embedded-gles: Port qt4-embedded-gles	recipe from oe-classic
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 20:00:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Wednesday, October 10, 2012 2:55 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 1/2] qt4-embedded-gles: Port qt4-
> embedded-gles recipe from oe-classic
>=20
> * Port qt4-embedded-gles recipe from oe-classic.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../qt4-embedded-gles/0001-wsegl2-support.patch    |  997
> ++++++++++++++++++++
>  .../qt4/qt4-embedded-gles/002_pvrqwswsegl.c.patch  |   11 +
>  .../qt4/qt4-embedded-gles/cursor-hack.diff         |   34 +
>  .../recipes-qt/qt4/qt4-embedded-gles/linux.conf    |   65 ++
>  .../recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb      |   28 +
>  5 files changed, 1135 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-
> embedded-gles/0001-wsegl2-support.patch
>  create mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-
> embedded-gles/002_pvrqwswsegl.c.patch
>  create mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-
> embedded-gles/cursor-hack.diff
>  create mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-
> embedded-gles/linux.conf
>  create mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-
> embedded-gles_4.8.0.bb
>=20
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/0001-wsegl2-support.patch b/meta-arago-extras/recipes-
> qt/qt4/qt4-embedded-gles/0001-wsegl2-support.patch
> new file mode 100644
> index 0000000..fcfd885
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/0001-
> wsegl2-support.patch
> @@ -0,0 +1,997 @@
> +diff -Nurp qt-everywhere-opensource-src-4.6.3-
> orig//src/3rdparty/powervr/wsegl2/pvr2d.h qt-everywhere-
> opensource-src-4.6.3/src/3rdparty/powervr/wsegl2/pvr2d.h
> +--- qt-everywhere-opensource-src-4.6.3-
> orig//src/3rdparty/powervr/wsegl2/pvr2d.h	1970-01-01
> 00:00:00.000000000 +0000
> ++++ qt-everywhere-opensource-src-
> 4.6.3/src/3rdparty/powervr/wsegl2/pvr2d.h	2011-05-16
> 22:51:43.158564336 +0000
> +@@ -0,0 +1,669 @@
> ++/**************************************************************
> ********
> ++*
> ++* Copyright(c) Imagination Technologies Ltd.
> ++*
> ++* The contents of this file are subject to the MIT license as
> set out below.
> ++*
> ++* Permission is hereby granted, free of charge, to any person
> obtaining a copy
> ++* of this software and associated documentation files (the
> "Software"),
> ++* to deal in the Software without restriction, including
> without limitation
> ++* the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> ++* and/or sell copies of the Software, and to permit persons to
> whom the
> ++* Software is furnished to do so, subject to the following
> conditions:
> ++*
> ++* The above copyright notice and this permission notice shall
> be included
> ++* in all copies or substantial portions of the Software.
> ++*
> ++* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> KIND, EXPRESS
> ++* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> ++* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> ++* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
> FOR ANY CLAIM,
> ++* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> TORT
> ++* OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> SOFTWARE
> ++* OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> ++*
> ++* This License is also included in this distribution in the
> file called
> ++* "COPYING".
> ++*
> ++***************************************************************
> ***************/
> ++
> ++
> ++
> ++/**************************************************************
> ****************
> ++Modifications :-
> ++$Log: pvr2d.h $
> ++
> ++ --- Revision Logs Removed ---
> ++***************************************************************
> ***************/
> ++
> ++#ifndef _PVR2D_H_
> ++#define _PVR2D_H_
> ++
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> ++
> ++/* PVR2D Platform-specific definitions */
> ++#if defined (__linux__)
> ++#define PVR2D_EXPORT __attribute__((visibility("default")))
> ++#define PVR2D_IMPORT
> ++#else
> ++#define PVR2D_EXPORT
> ++#define PVR2D_IMPORT
> ++#endif
> ++
> ++/* PVR2D header revision */
> ++#define PVR2D_REV_MAJOR		3
> ++#define PVR2D_REV_MINOR		5
> ++
> ++/* Basic types */
> ++typedef enum
> ++{
> ++	PVR2D_FALSE =3D 0,
> ++	PVR2D_TRUE
> ++} PVR2D_BOOL;
> ++
> ++typedef void* PVR2D_HANDLE;
> ++
> ++typedef char             PVR2D_CHAR,	*PVR2D_PCHAR;
> ++typedef unsigned char    PVR2D_UCHAR,	*PVR2D_PUCHAR;
> ++typedef int              PVR2D_INT,		*PVR2D_PINT;
> ++typedef unsigned int     PVR2D_UINT,	*PVR2D_PUINT;
> ++typedef long             PVR2D_LONG,	*PVR2D_PLONG;
> ++typedef unsigned long    PVR2D_ULONG,	*PVR2D_PULONG;
> ++
> ++typedef void             PVR2D_VOID,	*PVR2D_PVOID;
> ++
> ++
> ++/* error codes */
> ++typedef enum
> ++{
> ++	PVR2D_OK =3D 0,
> ++	PVR2DERROR_INVALID_PARAMETER =3D -1,
> ++	PVR2DERROR_DEVICE_UNAVAILABLE =3D -2,
> ++	PVR2DERROR_INVALID_CONTEXT =3D -3,
> ++	PVR2DERROR_MEMORY_UNAVAILABLE =3D -4,
> ++	PVR2DERROR_DEVICE_NOT_PRESENT =3D -5,
> ++	PVR2DERROR_IOCTL_ERROR =3D -6,
> ++	PVR2DERROR_GENERIC_ERROR =3D -7,
> ++	PVR2DERROR_BLT_NOTCOMPLETE =3D -8,
> ++	PVR2DERROR_HW_FEATURE_NOT_SUPPORTED =3D -9,
> ++	PVR2DERROR_NOT_YET_IMPLEMENTED =3D -10,
> ++	PVR2DERROR_MAPPING_FAILED =3D -11
> ++}PVR2DERROR;
> ++
> ++/* 32 bit PVR2D pixel format specifier */
> ++typedef unsigned long PVR2DFORMAT;
> ++
> ++/* Standard PVR2D pixel formats */
> ++#define	PVR2D_1BPP						0x00UL //
> 1bpp mask surface or palletized 1 bit source with 2x32 bit CLUT
> ++#define	PVR2D_RGB565					0x01UL //
> Common rgb 565 format
> ++#define	PVR2D_ARGB4444					0x02UL //
> Common argb 4444 format
> ++#define	PVR2D_RGB888					0x03UL //
> Common rgb 888 format (not supported)
> ++#define	PVR2D_ARGB8888					0x04UL //
> Common argb 8888 format
> ++#define	PVR2D_ARGB1555					0x05UL //
> Common argb 1555 format
> ++#define	PVR2D_ALPHA8					0x06UL //
> Alpha-only 8 bit per pixel (used with a constant fill colour)
> ++#define	PVR2D_ALPHA4					0x07UL //
> Alpha-only 4 bits per pixel (used with a constant fill colour)
> ++#define	PVR2D_PAL2						0x08UL //
> Palletized 2 bit format (requires   4x32 bit CLUT)
> ++#define	PVR2D_PAL4						0x09UL //
> Palletized 4 bit format (requires  16x32 bit CLUT)
> ++#define	PVR2D_PAL8						0x0AUL //
> Palletized 8 bit format (requires 256x32 bit CLUT)
> ++#define PVR2D_U8						0x10UL //
> monochrome unsigned 8 bit
> ++#define PVR2D_U88						0x11UL //
> monochrome unsigned 16 bit
> ++#define PVR2D_S8						0x12UL //
> signed 8 bit
> ++#define PVR2D_YUV422_YUYV				0x13UL // YUV 422
> low-high byte order Y0UY1V
> ++#define PVR2D_YUV422_UYVY				0x14UL // YUV 422
> low-high byte order UY0VY1
> ++#define PVR2D_YUV422_YVYU				0x15UL // YUV 422
> low-high byte order Y0VY1U
> ++#define PVR2D_YUV422_VYUY				0x16UL // YUV 422
> low-high byte order VY0UY1
> ++#define PVR2D_YUV420_2PLANE				0x17UL // YUV420
> 2 Plane
> ++#define PVR2D_YUV420_3PLANE				0x18UL // YUV420
> 3 Plane
> ++#define PVR2D_2101010ARGB				0x19UL // 32 bit
> 2 10 10 10
> ++#define PVR2D_888RSGSBS					0x1AUL
> ++#define PVR2D_16BPP_RAW					0x1BUL //
> 16 bit raw (no format conversion)
> ++#define PVR2D_32BPP_RAW					0x1CUL //
> 32 bit raw
> ++#define PVR2D_64BPP_RAW					0x1DUL //
> 64 bit raw
> ++#define PVR2D_128BPP_RAW				0x1EUL // 128 bit
> raw
> ++
> ++#define	PVR2D_NO_OF_FORMATS				0x1FUL
> ++
> ++/* Format modifier bit field (DstFormat and SrcFormat bits
> 16..23) */
> ++#define PVR2D_FORMAT_MASK				0x0000FFFFUL
> 	// PVR2D Format bits
> ++#define PVR2D_FORMAT_LAYOUT_MASK		0x000F0000UL	//
> Format layout (strided / twiddled / tiled)
> ++#define PVR2D_FORMAT_FLAGS_MASK			0x0FF00000UL
> 	// Surface Flags mask
> ++
> ++/* Layout */
> ++#define PVR2D_FORMAT_LAYOUT_SHIFT		16
> ++#define PVR2D_FORMAT_LAYOUT_STRIDED		0x00000000UL
> ++#define PVR2D_FORMAT_LAYOUT_TILED		0x00010000UL
> ++#define PVR2D_FORMAT_LAYOUT_TWIDDLED	0x00020000UL
> ++
> ++/*
> ++	PVR2D_SURFACE_PDUMP
> ++	This flag requests a surface pdump, to capture the pixel
> state after host writes.
> ++	Not needed if the surface state has resulted from previous
> SGX 2D/3D core writes.
> ++*/
> ++#define PVR2D_SURFACE_PDUMP				0x00100000UL
> 	// calls PVRSRVPDumpMem to capture the surface (pdump
> builds only)
> ++
> ++/*
> ++	Low level 3D format extension - for blts via the 3D core
> only.
> ++	If the top bit of the format field is set then PVR2D reads
> it as a PVRSRV_PIXEL_FORMAT.
> ++	The outcome is hardware dependant.
> ++	There is no guarantee that any specific PVRSRV format will
> be supported.
> ++*/
> ++#define PVR2D_FORMAT_PVRSRV				0x80000000
> ++
> ++/* wrap surface type */
> ++typedef enum
> ++{
> ++	PVR2D_WRAPFLAG_NONCONTIGUOUS =3D 0,
> ++	PVR2D_WRAPFLAG_CONTIGUOUS =3D 1,
> ++
> ++}PVR2DWRAPFLAGS;
> ++
> ++#define	PVR2D_CONTEXT_FLAGS_PRIORITY_MASK
> 	0x00000003
> ++
> ++#define	PVR2D_CONTEXT_FLAGS_LOW_PRIORITY_CONTEXT	1
> ++#define	PVR2D_CONTEXT_FLAGS_NORMAL_PRIORITY_CONTEXT	0
> ++#define	PVR2D_CONTEXT_FLAGS_HIGH_PRIORITY_CONTEXT	2
> ++
> ++/* flags for control information of additional blits */
> ++typedef enum
> ++{
> ++	PVR2D_BLIT_DISABLE_ALL					=3D
> 0x00000000,	/* disable all additional controls */
> ++	PVR2D_BLIT_CK_ENABLE					=3D
> 0x00000001,	/* enable colour key */
> ++	PVR2D_BLIT_GLOBAL_ALPHA_ENABLE			=3D
> 0x00000002,	/* enable standard global alpha */
> ++	PVR2D_BLIT_PERPIXEL_ALPHABLEND_ENABLE	=3D 0x00000004,
> 	/* enable per-pixel alpha bleding */
> ++	PVR2D_BLIT_PAT_SURFACE_ENABLE			=3D 0x00000008,
> 	/* enable pattern surf (disable fill) */
> ++	PVR2D_BLIT_FULLY_SPECIFIED_ALPHA_ENABLE	=3D 0x00000010,
> 	/* enable fully specified alpha */
> ++	PVR2D_BLIT_ROT_90						=3D
> 0x00000020,	/* apply 90 degree rotation to the blt */
> ++	PVR2D_BLIT_ROT_180						=3D
> 0x00000040,	/* apply 180 degree rotation to the blt */
> ++	PVR2D_BLIT_ROT_270						=3D
> 0x00000080,	/* apply 270 degree rotation to the blt */
> ++	PVR2D_BLIT_COPYORDER_TL2BR				=3D
> 0x00000100,	/* copy order overrides */
> ++	PVR2D_BLIT_COPYORDER_BR2TL				=3D
> 0x00000200,
> ++	PVR2D_BLIT_COPYORDER_TR2BL				=3D
> 0x00000400,
> ++	PVR2D_BLIT_COPYORDER_BL2TR				=3D
> 0x00000800,
> ++	PVR2D_BLIT_COLKEY_SOURCE				=3D
> 0x00001000,	/* Key colour is on the source surface */
> ++	PVR2D_BLIT_COLKEY_DEST					=3D
> 0x00002000,	/* Key colour is on the destination surface */
> ++	PVR2D_BLIT_COLKEY_MASKED				=3D
> 0x00004000,	/* Mask enabled for colour key */
> ++	PVR2D_BLIT_COLKEY_OP_PASS				=3D
> 0x00008000,	/* Colour key op =3D pass */
> ++	PVR2D_BLIT_COLKEY_OP_REJECT				=3D
> 0x00010000,	/* Colour key op =3D reject */
> ++	PVR2D_BLIT_PATH_2DCORE					=3D
> 0x00100000,	/* Blt via dedicated 2D Core or PTLA */
> ++	PVR2D_BLIT_PATH_3DCORE					=3D
> 0x00200000,	/* Blt via 3D Core */
> ++	PVR2D_BLIT_PATH_SWBLT					=3D
> 0x00400000,	/* Blt via host software */
> ++	PVR2D_BLIT_NO_SRC_SYNC_INFO				=3D
> 0x00800000,	/* Dont send a source sync info*/
> ++	PVR2D_BLIT_ISSUE_STATUS_UPDATES			=3D
> 0x01000000,	/* Issue status updates */
> ++
> ++} PVR2DBLITFLAGS;
> ++
> ++/* standard alpha-blending functions, AlphaBlendingFunc field
> of PVR2DBLTINFO */
> ++typedef enum
> ++{
> ++	PVR2D_ALPHA_OP_SRC_DSTINV =3D 1,	/* source alpha : Cdst
> =3D Csrc*Asrc + Cdst*(1-Asrc) */
> ++	PVR2D_ALPHA_OP_SRCP_DSTINV =3D 2	/* premultiplied source
> alpha : Cdst =3D Csrc + Cdst*(1-Asrc) */
> ++} PVR2D_ALPHABLENDFUNC;
> ++
> ++/* blend ops for fully specified alpha (SGX 2D Core only) */
> ++typedef enum
> ++{
> ++	PVR2D_BLEND_OP_ZERO =3D 0,
> ++	PVR2D_BLEND_OP_ONE =3D 1,
> ++	PVR2D_BLEND_OP_SRC =3D 2,
> ++	PVR2D_BLEND_OP_DST =3D 3,
> ++	PVR2D_BLEND_OP_GLOBAL =3D 4,
> ++	PVR2D_BLEND_OP_SRC_PLUS_GLOBAL =3D 5,
> ++	PVR2D_BLEND_OP_DST_PLUS_GLOBAL =3D 6
> ++}PVR2D_BLEND_OP;
> ++
> ++/* SGX 2D Core Fully specified alpha blend :	pAlpha field of
> PVR2DBLTINFO structure		*/
> ++/* a fully specified Alpha Blend operation is defined as
> 								*/
> ++/* DST (ALPHA) =3D (ALPHA_1 * SRC (ALPHA)) + (ALPHA_3 * DST
> (ALPHA))							*/
> ++/* DST (RGB)   =3D (ALPHA_2 * SRC (RGB)) + (ALPHA_4 * DST (RGB))
> 								*/
> ++/* if the pre-multiplication stage is enabled then the
> equations become the following:		*/
> ++/* PRE_MUL     =3D ((SRC(A)) * (Global Alpha Value))
> 									*/
> ++/* DST (ALPHA) =3D (ALPHA_1 * SRC (ALPHA)) + (PRE_MUL * DST
> (ALPHA))							*/
> ++/* DST (RGB)   =3D (ALPHA_2 * SRC (RGB)) + (PRE_MUL * DST (RGB))
> 								*/
> ++/* if the transparent source alpha stage is enabled then a
> source alpha of zero forces the	*/
> ++/* source to be transparent for that pixel regardless of the
> blend equation being used.		*/
> ++typedef struct _PVR2D_ALPHABLT
> ++{
> ++	PVR2D_BLEND_OP	eAlpha1;
> ++	PVR2D_BOOL		bAlpha1Invert;
> ++	PVR2D_BLEND_OP	eAlpha2;
> ++	PVR2D_BOOL		bAlpha2Invert;
> ++	PVR2D_BLEND_OP	eAlpha3;
> ++	PVR2D_BOOL		bAlpha3Invert;
> ++	PVR2D_BLEND_OP	eAlpha4;
> ++	PVR2D_BOOL		bAlpha4Invert;
> ++	PVR2D_BOOL		bPremulAlpha;			/* enable
> pre-multiplication stage */
> ++	PVR2D_BOOL		bTransAlpha;			/* enable
> transparent source alpha stage */
> ++	PVR2D_BOOL		bUpdateAlphaLookup;		/* enable
> and update the 1555-Lookup alpha table */
> ++	PVR2D_UCHAR		uAlphaLookup0;			/* 8 bit
> alpha when A=3D0 in a 1555-Lookup surface */
> ++	PVR2D_UCHAR		uAlphaLookup1;			/* 8 bit
> alpha when A=3D1 in a 1555-Lookup surface */
> ++	PVR2D_UCHAR		uGlobalRGB;				/* Global
> Alpha Value for RGB, 0=3Dtransparent 255=3Dopaque */
> ++	PVR2D_UCHAR		uGlobalA;				/* Global
> Alpha Value for Alpha */
> ++
> ++} PVR2D_ALPHABLT, *PPVR2D_ALPHABLT;
> ++
> ++
> ++/* surface memory info structure */
> ++typedef struct _PVR2DMEMINFO
> ++{
> ++	PVR2D_VOID			*pBase;
> ++	PVR2D_ULONG			ui32MemSize;
> ++	PVR2D_ULONG			ui32DevAddr;
> ++	PVR2D_ULONG			ulFlags;
> ++	PVR2D_VOID			*hPrivateData;
> ++	PVR2D_VOID			*hPrivateMapData;
> ++
> ++}PVR2DMEMINFO, *PPVR2DMEMINFO;
> ++
> ++
> ++#define PVR2D_MAX_DEVICE_NAME 20
> ++
> ++typedef struct _PVR2DDEVICEINFO
> ++{
> ++	PVR2D_ULONG		ulDevID;
> ++	PVR2D_CHAR		szDeviceName[PVR2D_MAX_DEVICE_NAME];
> ++}PVR2DDEVICEINFO;
> ++
> ++
> ++typedef struct _PVR2DISPLAYINFO
> ++{
> ++	PVR2D_ULONG	ulMaxFlipChains;
> ++	PVR2D_ULONG	ulMaxBuffersInChain;
> ++	PVR2DFORMAT	eFormat;
> ++	PVR2D_ULONG	ulWidth;
> ++	PVR2D_ULONG	ulHeight;
> ++	PVR2D_LONG	lStride;
> ++	PVR2D_ULONG	ulMinFlipInterval;
> ++	PVR2D_ULONG	ulMaxFlipInterval;
> ++
> ++}PVR2DDISPLAYINFO;
> ++
> ++
> ++typedef struct _PVR2MISCDISPLAYINFO
> ++{
> ++	PVR2D_ULONG ulPhysicalWidthmm;
> ++	PVR2D_ULONG ulPhysicalHeightmm;
> ++	PVR2D_ULONG ulUnused[10];
> ++
> ++}PVR2DMISCDISPLAYINFO;
> ++
> ++
> ++typedef struct _PVR2DBLTINFO
> ++{
> ++	PVR2D_ULONG		CopyCode;			/* rop code  */
> ++	PVR2D_ULONG		Colour;				/* fill
> colour */
> ++	PVR2D_ULONG		ColourKey;			/* colour key
> argb8888 (see CKEY_ defs below) */
> ++	PVR2D_UCHAR		GlobalAlphaValue;	/* global alpha
> blending */
> ++	PVR2D_UCHAR		AlphaBlendingFunc;	/* per-pixel
> alpha-blending function */
> ++
> ++	PVR2DBLITFLAGS	BlitFlags;			/* additional
> blit control information */
> ++
> ++	PVR2DMEMINFO	*pDstMemInfo;		/* destination
> memory */
> ++	PVR2D_ULONG		DstOffset;			/* byte offset
> from start of allocation to destination surface pixel 0,0 */
> ++	PVR2D_LONG		DstStride;			/* signed stride,
> the number of bytes from pixel 0,0 to 0,1 */
> ++	PVR2D_LONG		DstX, DstY;			/* pixel offset
> from start of dest surface to start of blt rectangle */
> ++	PVR2D_LONG		DSizeX,DSizeY;		/* blt size */
> ++	PVR2DFORMAT		DstFormat;			/* dest format */
> ++	PVR2D_ULONG		DstSurfWidth;		/* size of dest
> surface in pixels */
> ++	PVR2D_ULONG		DstSurfHeight;		/* size of dest
> surface in pixels */
> ++
> ++	PVR2DMEMINFO	*pSrcMemInfo;		/* source mem,
> (source fields are also used for patterns) */
> ++	PVR2D_ULONG		SrcOffset;			/* byte offset
> from start of allocation to src/pat surface pixel 0,0 */
> ++	PVR2D_LONG		SrcStride;			/* signed stride,
> the number of bytes from pixel 0,0 to 0,1 */
> ++	PVR2D_LONG		SrcX, SrcY;			/* pixel offset
> from start of surface to start of source rectangle */
> ++										/*
> for patterns this is the start offset within the pattern */
> ++	PVR2D_LONG		SizeX,SizeY;		/* source
> rectangle size or pattern size in pixels */
> ++	PVR2DFORMAT		SrcFormat;			/* source/pattern
> format */
> ++	PVR2DMEMINFO	*pPalMemInfo;		/* source/pattern
> palette memory containing argb8888 colour table */
> ++	PVR2D_ULONG		PalOffset;			/* byte offset
> from start of allocation to start of palette */
> ++	PVR2D_ULONG		SrcSurfWidth;		/* size of source
> surface in pixels */
> ++	PVR2D_ULONG		SrcSurfHeight;		/* size of source
> surface in pixels */
> ++
> ++	PVR2DMEMINFO	*pMaskMemInfo;		/* mask memory,
> 1bpp format implied */
> ++	PVR2D_ULONG		MaskOffset;			/* byte offset
> from start of allocation to mask surface pixel 0,0 */
> ++	PVR2D_LONG		MaskStride;			/* signed stride,
> the number of bytes from pixel 0,0 to 0,1 */
> ++	PVR2D_LONG		MaskX, MaskY;		/* mask rect top
> left (mask size =3D blt size) */
> ++	PVR2D_ULONG		MaskSurfWidth;		/* size of mask
> surface in pixels */
> ++	PVR2D_ULONG		MaskSurfHeight;		/* size of mask
> surface in pixels */
> ++
> ++	PPVR2D_ALPHABLT pAlpha;				/* fully
> specified alpha blend (2DCore only) */
> ++
> ++	PVR2D_ULONG		uSrcChromaPlane1;	/* mem offset from
> start of source alloc to chroma plane 1 */
> ++	PVR2D_ULONG		uSrcChromaPlane2;	/* mem offset from
> start of source alloc to chroma plane 2 */
> ++	PVR2D_ULONG		uDstChromaPlane1;	/* mem offset from
> start of dest alloc to chroma plane 1 */
> ++	PVR2D_ULONG		uDstChromaPlane2;	/* mem offset from
> start of dest alloc to chroma plane 2 */
> ++
> ++	PVR2D_ULONG		ColourKeyMask;		/* 32 bit colour
> key mask, only valid when PVR2D_BLIT_COLKEY_MASKED is set */
> ++
> ++}PVR2DBLTINFO, *PPVR2DBLTINFO;
> ++
> ++typedef struct _PVR2DRECT
> ++{
> ++	PVR2D_LONG left, top;
> ++	PVR2D_LONG right, bottom;
> ++} PVR2DRECT;
> ++
> ++typedef struct
> ++{
> ++	PVR2DMEMINFO	*pSurfMemInfo;		/* surface memory
> */
> ++	PVR2D_ULONG		SurfOffset;			/* byte offset
> from start of allocation to destination surface pixel 0,0 */
> ++	PVR2D_LONG		Stride;				/* signed
> stride */
> ++	PVR2DFORMAT		Format;				/* format
> */
> ++	PVR2D_ULONG		SurfWidth;			/* surface width
> in pixels */
> ++	PVR2D_ULONG		SurfHeight;			/* surface height
> in pixels */
> ++
> ++} PVR2D_SURFACE, *PPVR2D_SURFACE;
> ++
> ++typedef struct
> ++{
> ++	PVR2D_ULONG		uChromaPlane1;		/* YUV multiplane
> - byte offset from start of alloc to chroma plane 1 */
> ++	PVR2D_ULONG		uChromaPlane2;		/* YUV multiplane
> - byte offset from start of alloc to chroma plane 2 */
> ++	PVR2D_LONG		Reserved[2];		/* Reserved, must
> be zero */
> ++
> ++} PVR2D_SURFACE_EXT, *PPVR2D_SURFACE_EXT;
> ++
> ++typedef struct
> ++{
> ++	PVR2D_ULONG		*pUseCode;					/*
> USSE code */
> ++	PVR2D_ULONG		UseCodeSize;				/*
> usse code size in bytes */
> ++
> ++} PVR2D_USECODE, *PPVR2D_USECODE;
> ++
> ++typedef struct
> ++{
> ++	PVR2D_SURFACE			sDst;				/*
> destination surface */
> ++	PVR2D_SURFACE			sSrc;				/*
> source surface */
> ++	PVR2DRECT				rcDest;
> 	/* destination rectangle */
> ++	PVR2DRECT				rcSource;			/*
> source rectangle */
> ++	PVR2D_HANDLE			hUseCode;			/*
> custom USE code (NULL implies source copy) */
> ++	PVR2D_ULONG				UseParams[2];		/*
> per-blt params for use code */
> ++
> ++} PVR2D_3DBLT, *PPVR2D_3DBLT;
> ++
> ++typedef struct
> ++{
> ++	PVR2D_SURFACE			sDst;
> 		/* destination surface */
> ++	PVR2DRECT				rcDest;
> 			/* destination rectangle; scaling is supported
> */
> ++	PVR2D_SURFACE			sSrc;
> 		/* source surface */
> ++	PVR2DRECT				rcSource;
> 		/* source rectangle; scaling is supported */
> ++	PPVR2D_SURFACE			pSrc2;
> 			/* optional second source surface (NULL if not
> required) */
> ++	PVR2DRECT*				prcSource2;
> 		/* optional pSrc2 rectangle */
> ++	PVR2D_HANDLE			hUseCode;
> 		/* custom USSE shader code (NULL implies default
> source copy) */
> ++	PVR2D_ULONG				UseParams[2];
> 		/* per-blt params for usse code */
> ++	PVR2D_ULONG				uiNumTemporaryRegisters;
> 	/* no. of temporary registers used in custom shader code */
> ++	PVR2D_BOOL				bDisableDestInput;
> 		/* set true if the destination is output only */
> ++	PPVR2D_SURFACE_EXT		pDstExt;
> 		/* Extended format params for dest */
> ++	PPVR2D_SURFACE_EXT		pSrcExt[2];
> 		/* Extended format params for source 1 and 2 */
> ++	PVR2D_LONG				Reserved[4];
> 		/* Reserved, must be zero */
> ++
> ++} PVR2D_3DBLT_EXT, *PPVR2D_3DBLT_EXT;
> ++
> ++
> ++#define MAKE_COPY_BLIT(src,soff,dest,doff,sx,sy,dx,dy,sz)
> ++
> ++typedef void* PVR2DCONTEXTHANDLE;
> ++typedef void* PVR2DFLIPCHAINHANDLE;
> ++
> ++
> ++// CopyCode field of PVR2DBLTINFO structure:
> ++// the CopyCode field of the PVR2DBLTINFO structure should
> contain a rop3 or rop4 code.
> ++// a rop3 is an 8 bit code that describes a blt with three
> inputs : source dest and pattern
> ++// rop4 is a 16 bit code that describes a blt with four inputs
> : source dest pattern and mask
> ++// common rop3 codes are defined below
> ++// a colour fill blt is processed in the pattern channel as a
> constant colour with a rop code of 0xF0
> ++// PVR2D_BLIT_PAT_SURFACE_ENABLE defines whether the pattern
> channel is a surface or a fill colour.
> ++// a rop4 is defined by two rop3 codes, and the 1 bit-per-pixel
> mask surface defines which is used.
> ++// a common rop4 is 0xAAF0 which is the mask copy blt used for
> text glyphs.
> ++// CopyCode is taken to be a rop4 when pMaskMemInfo is non
> zero, otherwise it is assumed to be a rop3
> ++// use the PVR2DMASKROP4 macro below to construct a rop4 from
> two rop3's
> ++// rop3a is the rop used when mask pixel =3D 1, and rop3b when
> mask =3D 0
> ++#define PVR2DROP4(rop3b, rop3a)
> 	((rop3b<<8)|rop3a)
> ++
> ++/* common rop codes */
> ++#define PVR2DROPclear				0x00       /* 0
> (whiteness) */
> ++#define PVR2DROPset					0xFF       /* 1
> (blackness) */
> ++#define PVR2DROPnoop				0xAA       /* dst (used
> for masked blts) */
> ++
> ++/* source and  dest rop codes */
> ++#define PVR2DROPand					0x88       /* src
> AND dst */
> ++#define PVR2DROPandReverse			0x44       /* src AND
> NOT dst */
> ++#define PVR2DROPcopy				0xCC       /* src (used
> for source copy and alpha blts) */
> ++#define PVR2DROPandInverted			0x22       /* NOT src
> AND dst */
> ++#define PVR2DROPxor					0x66       /* src
> XOR dst */
> ++#define PVR2DROPor					0xEE       /* src
> OR dst */
> ++#define PVR2DROPnor					0x11       /* NOT
> src AND NOT dst */
> ++#define PVR2DROPequiv				0x99       /* NOT src
> XOR dst */
> ++#define PVR2DROPinvert				0x55       /* NOT
> dst */
> ++#define PVR2DROPorReverse			0xDD       /* src OR
> NOT dst */
> ++#define PVR2DROPcopyInverted		0x33       /* NOT src
> */
> ++#define PVR2DROPorInverted			0xBB       /* NOT src
> OR dst */
> ++#define PVR2DROPnand				0x77       /* NOT src
> OR NOT dst */
> ++
> ++/* pattern rop codes */
> ++#define PVR2DPATROPand				0xA0       /* pat
> AND dst */
> ++#define PVR2DPATROPandReverse		0x50       /* pat AND
> NOT dst */
> ++#define PVR2DPATROPcopy				0xF0       /* pat
> (used for solid color fills and pattern blts) */
> ++#define PVR2DPATROPandInverted		0x0A       /* NOT pat
> AND dst */
> ++#define PVR2DPATROPxor				0x5A       /* pat
> XOR dst */
> ++#define PVR2DPATROPor				0xFA       /* pat OR
> dst */
> ++#define PVR2DPATROPnor				0x05       /* NOT
> pat AND NOT dst */
> ++#define PVR2DPATROPequiv			0xA5       /* NOT pat
> XOR dst */
> ++#define PVR2DPATROPinvert			0x55       /* NOT dst
> */
> ++#define PVR2DPATROPorReverse		0xF5       /* pat OR
> NOT dst */
> ++#define PVR2DPATROPcopyInverted		0x0F       /* NOT pat
> */
> ++#define PVR2DPATROPorInverted		0xAF       /* NOT pat
> OR dst */
> ++#define PVR2DPATROPnand				0x5F       /* NOT
> pat OR NOT dst */
> ++
> ++/* common rop4 codes */
> ++#define PVR2DROP4MaskedCopy
> PVR2DROP4(PVR2DROPnoop,PVR2DROPcopy)		/* masked source
> copy blt (used for rounded window corners etc) */
> ++#define PVR2DROP4MaskedFill
> PVR2DROP4(PVR2DROPnoop,PVR2DPATROPcopy)	/* masked colour fill
> blt (used for text) */
> ++
> ++/* Legacy support */
> ++#define PVR2DROP3_PATMASK			PVR2DPATROPcopy
> ++#define PVR2DROP3_SRCMASK			PVR2DROPcopy
> ++
> ++/* pixmap memory alignment */
> ++#define PVR2D_ALIGNMENT_4			4			/*
> DWORD alignment */
> ++#define PVR2D_ALIGNMENT_ANY			0			/* no
> alignment    */
> ++#define PVR2D_ALIGNMENT_PALETTE		16			/* 16
> byte alignment is required for palettes */
> ++
> ++/* Heap number for PVR2DGetFrameBuffer */
> ++#define PVR2D_FB_PRIMARY_SURFACE 0
> ++
> ++#define PVR2D_PRESENT_PROPERTY_SRCSTRIDE	(1UL << 0)
> ++#define PVR2D_PRESENT_PROPERTY_DSTSIZE		(1UL << 1)
> ++#define PVR2D_PRESENT_PROPERTY_DSTPOS		(1UL << 2)
> ++#define PVR2D_PRESENT_PROPERTY_CLIPRECTS	(1UL << 3)
> ++#define PVR2D_PRESENT_PROPERTY_INTERVAL		(1UL << 4)
> ++
> ++#define PVR2D_CREATE_FLIPCHAIN_SHARED		(1UL << 0)
> ++#define PVR2D_CREATE_FLIPCHAIN_QUERY		(1UL << 1)
> ++#define PVR2D_CREATE_FLIPCHAIN_OEMOVERLAY   (1UL << 2)
> ++#define PVR2D_CREATE_FLIPCHAIN_AS_BLITCHAIN (1UL << 3)
> ++
> ++/* Colour-key colour must be translated into argb8888 format */
> ++#define CKEY_8888(P)		(P)
> ++#define CKEY_4444(P)		(((P&0xF000UL)<<16) |
> ((P&0x0F00UL)<<12) | ((P&0x00F0UL)<<8) | ((P&0x000FUL)<<4))
> ++#define CKEY_1555(P)		(((P&0x8000UL)<<16) |
> ((P&0x7C00UL)<<9)  | ((P&0x3E0UL)<<6)  | ((P&0x1FUL)<<3))
> ++#define CKEY_565(P)			(((P&0xF800UL)<<8)  |
> ((P&0x7E0UL)<<5)   | ((P&0x1FUL)<<3))
> ++#define CKEY_MASK_8888		0x00FFFFFFUL
> ++#define CKEY_MASK_4444		0x00F0F0F0UL
> ++#define CKEY_MASK_1555		0x00F8F8F8UL	/* Alpha is
> not normally included in the key test */
> ++#define CKEY_MASK_565		0x00F8FCF8UL
> ++
> ++/* Fill colours must be translated into argb8888 format */
> ++#define CFILL_4444(P)		(((P&0xF000UL)<<16) |
> ((P&0x0F00UL)<<12) | ((P&0x00F0UL)<<8) | ((P&0x000FUL)<<4))
> ++#define CFILL_1555(P)		(((P&0x8000UL)<<16) |
> ((P&0x7C00UL)<<9)  | ((P&0x3E0UL)<<6)  | ((P&0x1FUL)<<3))
> ++#define CFILL_565(P)		(((P&0xF800UL)<<8)  |
> ((P&0x7E0UL)<<5)   | ((P&0x1FUL)<<3))
> ++
> ++/* PVR2DCreateDeviceContext flags */
> ++#define PVR2D_XSERVER_PROC			0x00000001UL
> 	/*!< Set for the Xserver connection */
> ++
> ++/* PVR2DMemAlloc flags */
> ++#define PVR2D_MEM_UNCACHED			0x00000000UL	/*
> Default */
> ++#define PVR2D_MEM_CACHED			0x00000001UL	/*
> Caller must flush and sync when necessary */
> ++#define PVR2D_MEM_WRITECOMBINE		0x00000002UL
> ++
> ++/* Functions that the library exports */
> ++
> ++PVR2D_IMPORT
> ++int PVR2DEnumerateDevices(PVR2DDEVICEINFO *pDevInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DCreateDeviceContext(PVR2D_ULONG ulDevID,
> ++
> 	PVR2DCONTEXTHANDLE* phContext,
> ++									PVR2D_ULONG
> ulFlags);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DDestroyDeviceContext(PVR2DCONTEXTHANDLE
> hContext);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DGetDeviceInfo(PVR2DCONTEXTHANDLE hContext,
> ++							  PVR2DDISPLAYINFO
> *pDisplayInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DGetMiscDisplayInfo(PVR2DCONTEXTHANDLE hContext,
> ++							  PVR2DMISCDISPLAYINFO
> *pMiscDisplayInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DGetScreenMode(PVR2DCONTEXTHANDLE hContext,
> ++							  PVR2DFORMAT *pFormat,
> ++							  PVR2D_LONG *plWidth,
> ++							  PVR2D_LONG *plHeight,
> ++							  PVR2D_LONG *plStride,
> ++							  PVR2D_INT
> *piRefreshRate);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DGetFrameBuffer(PVR2DCONTEXTHANDLE hContext,
> ++							   PVR2D_INT nHeap,
> ++							   PVR2DMEMINFO
> **ppsMemInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DMemAlloc(PVR2DCONTEXTHANDLE hContext,
> ++						 PVR2D_ULONG ulBytes,
> ++						 PVR2D_ULONG ulAlign,
> ++						 PVR2D_ULONG ulFlags,
> ++						 PVR2DMEMINFO **ppsMemInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DMemExport(PVR2DCONTEXTHANDLE hContext,
> ++						 PVR2D_ULONG ulFlags,
> ++						 PVR2DMEMINFO *psMemInfo,
> ++						 PVR2D_HANDLE *phMemHandle);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DMemWrap(PVR2DCONTEXTHANDLE hContext,
> ++						PVR2D_VOID *pMem,
> ++						PVR2D_ULONG ulFlags,
> ++						PVR2D_ULONG ulBytes,
> ++						PVR2D_ULONG alPageAddress[],
> ++						PVR2DMEMINFO **ppsMemInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DMemMap(PVR2DCONTEXTHANDLE hContext,
> ++						PVR2D_ULONG ulFlags,
> ++						PVR2D_HANDLE hMemHandle,
> ++						PVR2DMEMINFO **ppsDstMem);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DMemFree(PVR2DCONTEXTHANDLE hContext,
> ++						PVR2DMEMINFO *psMemInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DBlt(PVR2DCONTEXTHANDLE hContext,
> ++					PVR2DBLTINFO *pBltInfo);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DBltClipped(PVR2DCONTEXTHANDLE hContext,
> ++						   PVR2DBLTINFO *pBltInfo,
> ++						   PVR2D_ULONG
> ulNumClipRects,
> ++						   PVR2DRECT *pClipRects);
> ++
> ++PVR2D_EXPORT
> ++PVR2DERROR PVR2DSet1555Alpha (PVR2DCONTEXTHANDLE hContext,
> ++							  PVR2D_UCHAR Alpha0,
> PVR2D_UCHAR Alpha1);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DQueryBlitsComplete(PVR2DCONTEXTHANDLE hContext,
> ++								   const
> PVR2DMEMINFO *pMemInfo,
> ++								   PVR2D_UINT
> uiWaitForComplete);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DSetPresentBltProperties(PVR2DCONTEXTHANDLE
> hContext,
> ++
> 	PVR2D_ULONG ulPropertyMask,
> ++
> 	PVR2D_LONG lSrcStride,
> ++
> 	PVR2D_ULONG ulDstWidth,
> ++
> 	PVR2D_ULONG ulDstHeight,
> ++
> 	PVR2D_LONG lDstXPos,
> ++
> 	PVR2D_LONG lDstYPos,
> ++
> 	PVR2D_ULONG ulNumClipRects,
> ++
> 	PVR2DRECT *pClipRects,
> ++
> 	PVR2D_ULONG ulSwapInterval);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DPresentBlt(PVR2DCONTEXTHANDLE hContext,
> ++						   PVR2DMEMINFO *pMemInfo,
> ++						   PVR2D_LONG lRenderID);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DCreateFlipChain(PVR2DCONTEXTHANDLE hContext,
> ++								PVR2D_ULONG
> ulFlags,
> ++								PVR2D_ULONG
> ulNumBuffers,
> ++								PVR2D_ULONG
> ulWidth,
> ++								PVR2D_ULONG
> ulHeight,
> ++								PVR2DFORMAT
> eFormat,
> ++								PVR2D_LONG
> *plStride,
> ++								PVR2D_ULONG
> *pulFlipChainID,
> ++
> 	PVR2DFLIPCHAINHANDLE *phFlipChain);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DDestroyFlipChain(PVR2DCONTEXTHANDLE hContext,
> ++
> PVR2DFLIPCHAINHANDLE hFlipChain);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DGetFlipChainBuffers(PVR2DCONTEXTHANDLE
> hContext,
> ++
> 	PVR2DFLIPCHAINHANDLE hFlipChain,
> ++									PVR2D_ULONG
> *pulNumBuffers,
> ++
> 	PVR2DMEMINFO *psMemInfo[]);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DSetPresentFlipProperties(PVR2DCONTEXTHANDLE
> hContext,
> ++
> PVR2DFLIPCHAINHANDLE hFlipChain,
> ++
> PVR2D_ULONG ulPropertyMask,
> ++
> PVR2D_LONG lDstXPos,
> ++
> PVR2D_LONG lDstYPos,
> ++
> PVR2D_ULONG ulNumClipRects,
> ++
> PVR2DRECT *pClipRects,
> ++
> PVR2D_ULONG ulSwapInterval);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DPresentFlip(PVR2DCONTEXTHANDLE hContext,
> ++							PVR2DFLIPCHAINHANDLE
> hFlipChain,
> ++							PVR2DMEMINFO
> *psMemInfo,
> ++							PVR2D_LONG lRenderID);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DGetAPIRev(PVR2D_LONG *lRevMajor, PVR2D_LONG
> *lRevMinor);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DLoadUseCode (const PVR2DCONTEXTHANDLE hContext,
> const PVR2D_UCHAR	*pUseCode,
> ++									const
> PVR2D_ULONG UseCodeSize, PVR2D_HANDLE *pUseCodeHandle);
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DFreeUseCode (const PVR2DCONTEXTHANDLE hContext,
> const PVR2D_HANDLE hUseCodeHandle);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DBlt3D (const PVR2DCONTEXTHANDLE hContext, const
> PPVR2D_3DBLT pBlt3D);
> ++
> ++PVR2D_IMPORT
> ++PVR2DERROR PVR2DBlt3DExt (const PVR2DCONTEXTHANDLE hContext,
> const PPVR2D_3DBLT_EXT pBlt3D);
> ++
> ++#ifdef __cplusplus
> ++}
> ++#endif
> ++
> ++#endif /* _PVR2D_H_ */
> ++
> ++/**************************************************************
> ****************
> ++ End of file (pvr2d.h)
> ++***************************************************************
> ***************/
> +diff -Nurp qt-everywhere-opensource-src-4.6.3-
> orig//src/3rdparty/powervr/wsegl2/wsegl.h qt-everywhere-
> opensource-src-4.6.3/src/3rdparty/powervr/wsegl2/wsegl.h
> +--- qt-everywhere-opensource-src-4.6.3-
> orig//src/3rdparty/powervr/wsegl2/wsegl.h	1970-01-01
> 00:00:00.000000000 +0000
> ++++ qt-everywhere-opensource-src-
> 4.6.3/src/3rdparty/powervr/wsegl2/wsegl.h	2011-05-16
> 22:51:52.702601769 +0000
> +@@ -0,0 +1,285 @@
> ++/**************************************************************
> ********
> ++*
> ++* Copyright(c) Imagination Technologies Ltd.
> ++*
> ++* The contents of this file are subject to the MIT license as
> set out below.
> ++*
> ++* Permission is hereby granted, free of charge, to any person
> obtaining a copy
> ++* of this software and associated documentation files (the
> "Software"),
> ++* to deal in the Software without restriction, including
> without limitation
> ++* the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> ++* and/or sell copies of the Software, and to permit persons to
> whom the
> ++* Software is furnished to do so, subject to the following
> conditions:
> ++*
> ++* The above copyright notice and this permission notice shall
> be included
> ++* in all copies or substantial portions of the Software.
> ++*
> ++* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> KIND, EXPRESS
> ++* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> ++* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> ++* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
> FOR ANY CLAIM,
> ++* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> TORT
> ++* OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> SOFTWARE
> ++* OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> ++*
> ++* This License is also included in this distribution in the
> file called
> ++* "COPYING".
> ++*
> ++***************************************************************
> ***************/
> ++
> ++
> ++
> ++#if !defined(__WSEGL_H__)
> ++#define __WSEGL_H__
> ++
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> ++
> ++/*
> ++// WSEGL Platform-specific definitions
> ++*/
> ++#if defined(__linux__)
> ++#define WSEGL_EXPORT __attribute__((visibility("default")))
> ++#define WSEGL_IMPORT
> ++#else
> ++#define WSEGL_EXPORT
> ++#define WSEGL_IMPORT
> ++#endif
> ++
> ++/*
> ++// WSEGL API Version Number
> ++*/
> ++
> ++#define WSEGL_VERSION 2
> ++#define WSEGL_DEFAULT_DISPLAY 0
> ++#define WSEGL_DEFAULT_NATIVE_ENGINE 0
> ++
> ++#define WSEGL_FALSE		0
> ++#define WSEGL_TRUE		1
> ++#define WSEGL_NULL		0
> ++
> ++#define	WSEGL_UNREFERENCED_PARAMETER(param) (param) =3D (param)
> ++
> ++/*
> ++// WSEGL handles
> ++*/
> ++typedef void *WSEGLDisplayHandle;
> ++typedef void *WSEGLDrawableHandle;
> ++
> ++/*
> ++// Display capability type
> ++*/
> ++typedef enum WSEGLCapsType_TAG
> ++{
> ++	WSEGL_NO_CAPS =3D 0,
> ++	WSEGL_CAP_MIN_SWAP_INTERVAL =3D 1, /* System default value =3D
> 1 */
> ++	WSEGL_CAP_MAX_SWAP_INTERVAL =3D 2, /* System default value =3D
> 1 */
> ++	WSEGL_CAP_WINDOWS_USE_HW_SYNC =3D 3, /* System default value
> =3D 0 (FALSE) */
> ++	WSEGL_CAP_PIXMAPS_USE_HW_SYNC =3D 4, /* System default value
> =3D 0 (FALSE) */
> ++
> ++} WSEGLCapsType;
> ++
> ++/*
> ++// Display capability
> ++*/
> ++typedef struct WSEGLCaps_TAG
> ++{
> ++	WSEGLCapsType eCapsType;
> ++	unsigned long ui32CapsValue;
> ++
> ++} WSEGLCaps;
> ++
> ++/*
> ++// Drawable type
> ++*/
> ++#define WSEGL_NO_DRAWABLE			0x0
> ++#define WSEGL_DRAWABLE_WINDOW		0x1
> ++#define WSEGL_DRAWABLE_PIXMAP		0x2
> ++
> ++
> ++/*
> ++// Pixel format of display/drawable
> ++*/
> ++typedef enum WSEGLPixelFormat_TAG
> ++{
> ++	/* These must not be re-ordered */
> ++	WSEGL_PIXELFORMAT_RGB565	=3D 0,
> ++	WSEGL_PIXELFORMAT_ARGB4444	=3D 1,
> ++	WSEGL_PIXELFORMAT_ARGB8888	=3D 2,
> ++	WSEGL_PIXELFORMAT_ARGB1555	=3D 3,
> ++	WSEGL_PIXELFORMAT_ABGR8888	=3D 4,
> ++	WSEGL_PIXELFORMAT_XBGR8888	=3D 5,
> ++
> ++	/* These are compatibility names only; new WSEGL
> ++	 * modules should not use them.
> ++	 */
> ++	WSEGL_PIXELFORMAT_565		=3D WSEGL_PIXELFORMAT_RGB565,
> ++	WSEGL_PIXELFORMAT_4444		=3D WSEGL_PIXELFORMAT_ARGB4444,
> ++	WSEGL_PIXELFORMAT_8888		=3D WSEGL_PIXELFORMAT_ARGB8888,
> ++	WSEGL_PIXELFORMAT_1555		=3D WSEGL_PIXELFORMAT_ARGB1555,
> ++
> ++} WSEGLPixelFormat;
> ++
> ++/*
> ++// Transparent of display/drawable
> ++*/
> ++typedef enum WSEGLTransparentType_TAG
> ++{
> ++	WSEGL_OPAQUE =3D 0,
> ++	WSEGL_COLOR_KEY =3D 1,
> ++
> ++} WSEGLTransparentType;
> ++
> ++/*
> ++// Display/drawable configuration
> ++*/
> ++typedef struct WSEGLConfig_TAG
> ++{
> ++	/*
> ++	// Type of drawables this configuration applies to -
> ++	// OR'd values of drawable types.
> ++	*/
> ++	unsigned long ui32DrawableType;
> ++
> ++	/* Pixel format */
> ++	WSEGLPixelFormat ePixelFormat;
> ++
> ++	/* Native Renderable  - set to WSEGL_TRUE if native
> renderable */
> ++	unsigned long ulNativeRenderable;
> ++
> ++	/* FrameBuffer Level Parameter */
> ++	unsigned long ulFrameBufferLevel;
> ++
> ++	/* Native Visual ID */
> ++	unsigned long ulNativeVisualID;
> ++
> ++	/* Native Visual */
> ++	void *hNativeVisual;
> ++
> ++	/* Transparent Type */
> ++	WSEGLTransparentType eTransparentType;
> ++
> ++	/* Transparent Color - only used if transparent type is
> COLOR_KEY */
> ++	unsigned long ulTransparentColor; /* packed as 0x00RRGGBB
> */
> ++
> ++
> ++} WSEGLConfig;
> ++
> ++/*
> ++// WSEGL errors
> ++*/
> ++typedef enum WSEGLError_TAG
> ++{
> ++	WSEGL_SUCCESS =3D 0,
> ++	WSEGL_CANNOT_INITIALISE =3D 1,
> ++	WSEGL_BAD_NATIVE_DISPLAY =3D 2,
> ++	WSEGL_BAD_NATIVE_WINDOW =3D 3,
> ++	WSEGL_BAD_NATIVE_PIXMAP =3D 4,
> ++	WSEGL_BAD_NATIVE_ENGINE =3D 5,
> ++	WSEGL_BAD_DRAWABLE =3D 6,
> ++	WSEGL_BAD_MATCH =3D 7,
> ++	WSEGL_OUT_OF_MEMORY =3D 8,
> ++
> ++	/* These are compatibility names only; new WSEGL
> ++	 * modules should not use them.
> ++	 */
> ++	WSEGL_BAD_CONFIG =3D WSEGL_BAD_MATCH,
> ++
> ++} WSEGLError;
> ++
> ++/*
> ++// Drawable orientation (in degrees anti-clockwise)
> ++*/
> ++typedef enum WSEGLRotationAngle_TAG
> ++{
> ++	WSEGL_ROTATE_0 =3D 0,
> ++	WSEGL_ROTATE_90 =3D 1,
> ++	WSEGL_ROTATE_180 =3D 2,
> ++	WSEGL_ROTATE_270 =3D 3
> ++
> ++} WSEGLRotationAngle;
> ++
> ++/*
> ++// Drawable information required by OpenGL-ES driver
> ++*/
> ++typedef struct WSEGLDrawableParams_TAG
> ++{
> ++	/* Width in pixels of the drawable */
> ++	unsigned long	ui32Width;
> ++
> ++	/* Height in pixels of the drawable */
> ++	unsigned long	ui32Height;
> ++
> ++	/* Stride in pixels of the drawable */
> ++	unsigned long	ui32Stride;
> ++
> ++	/* Pixel format of the drawable */
> ++	WSEGLPixelFormat	ePixelFormat;
> ++
> ++	/* User space cpu virtual address of the drawable */
> ++	void   			*pvLinearAddress;
> ++
> ++	/* HW address of the drawable */
> ++	unsigned long	ui32HWAddress;
> ++
> ++	/* Private data for the drawable */
> ++	void			*hPrivateData;
> ++
> ++
> ++} WSEGLDrawableParams;
> ++
> ++
> ++/*
> ++// Table of function pointers that is returned by
> WSEGL_GetFunctionTablePointer()
> ++//
> ++// The first entry in the table is the version number of the
> wsegl.h header file that
> ++// the module has been written against, and should therefore be
> set to WSEGL_VERSION
> ++*/
> ++typedef struct WSEGL_FunctionTable_TAG
> ++{
> ++	unsigned long ui32WSEGLVersion;
> ++
> ++	WSEGLError (*pfnWSEGL_IsDisplayValid)(NativeDisplayType);
> ++
> ++	WSEGLError (*pfnWSEGL_InitialiseDisplay)(NativeDisplayType,
> WSEGLDisplayHandle *, const WSEGLCaps **, WSEGLConfig **);
> ++
> ++	WSEGLError (*pfnWSEGL_CloseDisplay)(WSEGLDisplayHandle);
> ++
> ++	WSEGLError
> (*pfnWSEGL_CreateWindowDrawable)(WSEGLDisplayHandle, WSEGLConfig
> *, WSEGLDrawableHandle *, NativeWindowType, WSEGLRotationAngle
> *);
> ++
> ++	WSEGLError
> (*pfnWSEGL_CreatePixmapDrawable)(WSEGLDisplayHandle, WSEGLConfig
> *, WSEGLDrawableHandle *, NativePixmapType, WSEGLRotationAngle
> *);
> ++
> ++	WSEGLError (*pfnWSEGL_DeleteDrawable)(WSEGLDrawableHandle);
> ++
> ++	WSEGLError (*pfnWSEGL_SwapDrawable)(WSEGLDrawableHandle,
> unsigned long);
> ++
> ++	WSEGLError
> (*pfnWSEGL_SwapControlInterval)(WSEGLDrawableHandle, unsigned
> long);
> ++
> ++	WSEGLError (*pfnWSEGL_WaitNative)(WSEGLDrawableHandle,
> unsigned long);
> ++
> ++	WSEGLError
> (*pfnWSEGL_CopyFromDrawable)(WSEGLDrawableHandle,
> NativePixmapType);
> ++
> ++	WSEGLError (*pfnWSEGL_CopyFromPBuffer)(void *, unsigned
> long, unsigned long, unsigned long, WSEGLPixelFormat,
> NativePixmapType);
> ++
> ++	WSEGLError
> (*pfnWSEGL_GetDrawableParameters)(WSEGLDrawableHandle,
> WSEGLDrawableParams *, WSEGLDrawableParams *);
> ++
> ++	WSEGLError
> (*pfnWSEGL_ConnectDrawable)(WSEGLDrawableHandle);
> ++
> ++	WSEGLError
> (*pfnWSEGL_DisconnectDrawable)(WSEGLDrawableHandle);
> ++
> ++
> ++} WSEGL_FunctionTable;
> ++
> ++
> ++WSEGL_IMPORT const WSEGL_FunctionTable
> *WSEGL_GetFunctionTablePointer(void);
> ++
> ++#ifdef __cplusplus
> ++}
> ++#endif
> ++
> ++#endif /* __WSEGL_H__ */
> ++
> ++/**************************************************************
> ****************
> ++ End of file (wsegl.h)
> ++***************************************************************
> ***************/
> +diff -Nurp qt-everywhere-opensource-src-4.6.3-
> orig//src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c qt-
> everywhere-opensource-src-
> 4.6.3/src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c
> +--- qt-everywhere-opensource-src-4.6.3-
> orig//src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c	2010-
> 06-02 02:03:17.000000000 +0000
> ++++ qt-everywhere-opensource-src-
> 4.6.3/src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c	2011-
> 05-16 23:08:51.618597097 +0000
> +@@ -378,6 +378,20 @@ static WSEGLError wseglGetDrawableParame
> +     return WSEGL_SUCCESS;
> + }
> +
> ++/* Function stub for ConnectDrawable() */
> ++static WSEGLError wseglConnectDrawable(WSEGLDrawableHandle
> hDrawable)
> ++{
> ++    WSEGL_UNREFERENCED_PARAMETER(hDrawable);
> ++    return WSEGL_SUCCESS;
> ++}
> ++
> ++/* Function stub for DisconnectDrawable() */
> ++static WSEGLError wseglDisconnectDrawable(WSEGLDrawableHandle
> hDrawable)
> ++{
> ++    WSEGL_UNREFERENCED_PARAMETER(hDrawable);
> ++    return WSEGL_SUCCESS;
> ++}
> ++
> + static WSEGL_FunctionTable const wseglFunctions =3D {
> +     WSEGL_VERSION,
> +     wseglIsDisplayValid,
> +@@ -391,7 +405,9 @@ static WSEGL_FunctionTable const wseglFu
> +     wseglWaitNative,
> +     wseglCopyFromDrawable,
> +     wseglCopyFromPBuffer,
> +-    wseglGetDrawableParameters
> ++    wseglGetDrawableParameters,
> ++    wseglConnectDrawable,
> ++    wseglDisconnectDrawable
> + };
> +
> + /* Return the table of WSEGL functions to the EGL
> implementation */
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/002_pvrqwswsegl.c.patch b/meta-arago-extras/recipes-
> qt/qt4/qt4-embedded-gles/002_pvrqwswsegl.c.patch
> new file mode 100644
> index 0000000..8729ea3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/002_pvrqwswsegl.c.patch
> @@ -0,0 +1,11 @@
> +--- ./src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl_orig.c
> 	2012-02-27 18:53:22.919285167 +0530
> ++++ ./src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c
> 	2012-02-25 11:26:47.131221091 +0530
> +@@ -39,7 +39,7 @@
> + **
> +
> *****************************************************************
> ***********/
> +
> +-#include <GLES/eglplatform.h>
> ++#include <EGL/eglplatform.h>
> + #include <wsegl.h>
> + #include <pvr2d.h>
> + #include <string.h>
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/cursor-hack.diff b/meta-arago-extras/recipes-qt/qt4/qt4-
> embedded-gles/cursor-hack.diff
> new file mode 100644
> index 0000000..683b3c4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/cursor-
> hack.diff
> @@ -0,0 +1,34 @@
> +Patch originally done by Bin Liu, rediffed by Koen Kooi for Qt
> 4.6.2
> +
> +This patch is a first step to get a working cursor when using
> the powervr driver, it flickers when hovering over a QGLWidget,
> but still better than no cursor at all
> +
> +--- /tmp/pvreglscreen.cpp	2010-04-19 09:30:32.000000000 +0200
> ++++ qt-everywhere-opensource-src-
> 4.6.2/src/plugins/gfxdrivers/powervr/pvreglscreen/pvreglscreen.cp
> p	2010-04-19 09:31:30.000000000 +0200
> +@@ -85,6 +85,9 @@
> + bool PvrEglScreen::initDevice()
> + {
> +     openTty();
> ++#ifndef QT_NO_QWS_CURSOR
> ++    QScreenCursor::initSoftwareCursor();
> ++#endif
> +     return true;
> + }
> +
> +--- /tmp/qwindowsystem_qws.cpp	2010-04-19 09:32:47.000000000
> +0200
> ++++ qt-everywhere-opensource-src-
> 4.6.2/src/gui/embedded/qwindowsystem_qws.cpp	2010-04-19
> 09:33:30.000000000 +0200
> +@@ -3501,7 +3501,6 @@
> +         }
> +
> + #ifdef QT_QWS_CLIENTBLIT
> +-#ifdef QT_NO_QWS_CURSOR
> +         // This optimization only really works when there isn't
> a crazy cursor
> +         // wizzing around.
> +         QRegion directPaint =3D (r - transparentRegion); // in
> gloal coords
> +@@ -3513,7 +3512,6 @@
> +
> QWSRegionEvent::DirectPaint, id);
> +         }
> + #endif
> +-#endif
> +     }
> +
> +     if (doLock)
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/linux.conf b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/linux.conf
> new file mode 100644
> index 0000000..7a96715
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles/linux.conf
> @@ -0,0 +1,65 @@
> +#
> +# qmake configuration for common linux
> +#
> +
> +QMAKE_CFLAGS_THREAD	+=3D -D_REENTRANT
> +QMAKE_CXXFLAGS_THREAD	+=3D $$QMAKE_CFLAGS_THREAD
> +
> +QMAKE_INCDIR          =3D
> +QMAKE_LIBDIR          =3D
> +QMAKE_INCDIR_X11      =3D
> +QMAKE_LIBDIR_X11      =3D
> +QMAKE_INCDIR_QT       =3D $(OE_QMAKE_INCDIR_QT)
> +QMAKE_LIBDIR_QT       =3D $(OE_QMAKE_LIBDIR_QT)
> +QMAKE_INCDIR_OPENGL   =3D ${STAGING_INCDIR}/GLES
> +QMAKE_LIBDIR_OPENGL   =3D ${STAGING_LIBDIR}
> +QMAKE_INCDIR_OPENGL_ES1 =3D ${STAGING_INCDIR}/GLES
> +QMAKE_LIBDIR_OPENGL_ES1 =3D ${STAGING_LIBDIR}
> +QMAKE_INCDIR_OPENGL_ES2 =3D ${STAGING_INCDIR}/GLES2
> +QMAKE_LIBDIR_OPENGL_ES2 =3D ${STAGING_LIBDIR}
> +QMAKE_INCDIR_EGL      =3D ${STAGING_INCDIR}/GLES2
> +QMAKE_LIBDIR_EGL      =3D ${STAGING_LIBDIR}
> +
> +QMAKE_LIBS            =3D -Wl,-rpath-link,SEDME/lib -lglib-2.0
> +QMAKE_LIBS_DYNLOAD    =3D -ldl
> +QMAKE_LIBS_X11        =3D $(OE_QMAKE_LIBS_X11)
> +QMAKE_LIBS_X11SM      =3D $(OE_QMAKE_LIBS_X11SM)
> +QMAKE_LIBS_NIS        =3D -lnsl
> +QMAKE_LIBS_EGL        =3D -lEGL -lIMGegl -lsrv_um
> +QMAKE_LIBS_OPENGL     =3D -lEGL -lGLES_CM -lIMGegl -lsrv_um
> +QMAKE_LIBS_OPENGL_QT  =3D -lEGL -lGLES_CM -lIMGegl -lsrv_um
> +QMAKE_LIBS_OPENGL_ES1 =3D -lEGL -lGLES_CM -lIMGegl -lsrv_um
> +QMAKE_LIBS_OPENGL_ES2 =3D -lEGL -lGLESv2 -lGLES_CM -lIMGegl -
> lsrv_um
> +QMAKE_LIBS_THREAD     =3D -lpthread
> +
> +QMAKE_MOC             =3D $(OE_QMAKE_MOC)
> +QMAKE_UIC             =3D $(OE_QMAKE_UIC)
> +QMAKE_UIC3            =3D $(OE_QMAKE_UIC3)
> +QMAKE_RCC             =3D $(OE_QMAKE_RCC)
> +QMAKE_QDBUSCPP2XML    =3D $(OE_QMAKE_QDBUSCPP2XML)
> +QMAKE_QDBUSXML2CPP    =3D $(OE_QMAKE_QDBUSXML2CPP)
> +
> +QMAKE_AR              =3D $(OE_QMAKE_AR) cqs
> +QMAKE_OBJCOPY         =3D ${OBJCOPY}
> +QMAKE_RANLIB          =3D
> +
> +QMAKE_TAR             =3D tar -cf
> +QMAKE_GZIP            =3D gzip -9f
> +
> +QMAKE_COPY            =3D cp -f
> +QMAKE_COPY_FILE       =3D $(COPY)
> +QMAKE_COPY_DIR        =3D $(COPY) -r
> +QMAKE_MOVE            =3D mv -f
> +QMAKE_DEL_FILE        =3D rm -f
> +QMAKE_DEL_DIR         =3D rmdir
> +QMAKE_STRIP           =3D $(OE_QMAKE_STRIP)
> +QMAKE_STRIPFLAGS_LIB +=3D --strip-unneeded
> +QMAKE_CHK_DIR_EXISTS  =3D test -d
> +QMAKE_MKDIR           =3D mkdir -p
> +QMAKE_INSTALL_FILE    =3D install -m 644 -p
> +QMAKE_INSTALL_PROGRAM =3D install -m 755 -p
> +
> +#These defines are documented in the powervr README, please read
> it
> +DEFINES +=3D QT_QWS_CLIENTBLIT
> +
> +include(unix.conf)
> diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles_4.8.0.bb b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-
> gles_4.8.0.bb
> new file mode 100644
> index 0000000..c26cc2c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bb
> @@ -0,0 +1,28 @@
> +require ${COREBASE}/meta/recipes-qt/qt4/qt-${PV}.inc
> +require ${COREBASE}/meta/recipes-qt/qt4/qt4-embedded.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +FILESEXTRAPATHS_append :=3D
> "${THISDIR}/${PN}:${COREBASE}/meta/recipes-qt/qt4/qt-
> 4.8.0:${COREBASE}/meta/recipes-qt/qt4/files:"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI +=3D " \
> +           file://0001-wsegl2-support.patch \
> +           file://002_pvrqwswsegl.c.patch \
> +           file://cursor-hack.diff \
> +"
> +
> +QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> +
> +QT_CONFIG_FLAGS +=3D " \
> + -exceptions \
> +"

Could you also inlcude the .bb file so that the QT_CONFIG_FLAGS settings wo=
uld be picked up from there?  A quick test on my system shows this seeming =
to work.  i.e.

require ${COREBASE}/meta/recipes-qt/qt4/qt4-embedded_${PV}.bb

I also added a

PR_append =3D ".0"

To allow changing the PR based on changes to any of the patches or flags se=
t in this recipe.

> +
> +QT_GLFLAGS =3D "-opengl es2 -depths 16,24,32 -plugin-gfx-powervr -
> D QT_QWS_CLIENTBLIT"
> +
> +PROVIDES +=3D "qt4-embedded"
> +RPROVIDES_${PN} +=3D "qt4-embedded"
> +RPROVIDES_${PN}-dev +=3D "qt4-embedded-dev"
> +
> +DEPENDS +=3D "virtual/egl"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

