Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A2322529BD
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 09:03:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M93BBC013315
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 04:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521709391;
	bh=se1A91tnna+thd7KQoFw41YwoYg4oyla6x7EIK4S4ss=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=A+ArTZfOZzKMA+DdQThyXaXViWlg+jQMW0G0/6oGa1wUKYnZopUINAFlpLXTgQQfo
	vHoer3ppQ0mYeeGZyxSMzx4lmLWR58DfovVhDP6PfJXO/Y0WNFMWXGzWND6zad6f8P
	XwmKyRv6+jQ77jCbN18rki7iEVVDcEaCb7JFqBrM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M93B6x020162
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 04:03:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 04:03:10 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1261.035; Thu, 22 Mar 2018 04:03:10 -0500
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Prasad, Ram" <x0038811@ti.com>
Thread-Topic: [EXTERNAL] [meta-arago] [rocko 0/9] Gstreamer1.12.2 enablement
	for rocko
Thread-Index: AQHTwZM6MhqAnzTJSUSltzMFtKglGqPb9eXA
Date: Thu, 22 Mar 2018 09:03:10 +0000
Message-ID: <59acc7687e5f445180eecd635effd516@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.158.35]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [rocko 0/9] Gstreamer1.12.2 enablement for rocko
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
X-List-Received-Date: Thu, 22 Mar 2018 09:03:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK. I've reviewed the patch series and it looks good.

Denys,

Patch 0001-*.patch which is a cleanup of the existing patches is not visibl=
e on the mailing list due to its size.
We can send out this patch separately if you still don't see it.

Regards
Karthik

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Prasad, Ram
Sent: Thursday, 22 March, 2018 9:37 AM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [rocko 0/9] Gstreamer1.12.2 enablement for=
 rocko

This patchset enables the following features.
1) Gstreamer good plugin fix for v4l2src
2) kmssink and waylandsink support along with bugfixes.
3) Optimization in gstvpe to fix frame-copy issue

Ramprasad N (9):
  gstreamer1.0*-bad: Clean up gstreamer 1.8 bad patches
  gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
  gstreamer1.0*-bad: Add drmallocator support
  gstreamer1.0*-bad: Add parser specific fixes
  gstreamer1.0*-bad: Enable kmssink with gst 1.12
  wayland-protocols: Add drm protocol to stable
  gstreamer1.0*-bad: Add DRM support to waylandsink
  gstvpe: Fix frame-copy issue with playbin
  branding-{core, processor-sdk}: re-enable mmip

 .../conf/distro/include/branding-core.inc          |    4 -
 .../conf/distro/include/branding-processor-sdk.inc |    4 -
 ...nd-drm-Add-wayland-drm-protocol-to-stable.patch |  179 ++
 .../wayland/wayland-protocols_1.10.bbappend        |   15 +
 ...late-the-output-structure-with-progressiv.patch |   33 +
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |    3 +-
 ...-mouse-movement-for-videos-on-waylandsink.patch |  404 -----
 ...gstdrmallocator-Add-DRM-allocator-support.patch |   42 +-
 ...ylandsink-Add-mouse-drag-and-drop-support.patch |  408 -----
 ...waylandsink-add-input-format-I420-support.patch |   89 -
 .../0002-kmssink-remove-DCE-dependencies.patch     |   96 --
 ...tch =3D> 0002-parsers-bug-fixes-on-parsers.patch} |   37 +-
 ...gstkmssink-Add-support-for-KMS-based-sink.patch | 1592 ----------------=
--  ...Add-omapdrm-in-the-list-of-driver-modules.patch |  165 ++
 .../0003-kmssink-add-YUYV-support.patch            |   81 -
 ...aylandsink-Add-DRM-support-on-waylandsink.patch | 1728 ----------------=
----  ...aylandsink-Add-drm-support-in-waylandsink.patch |  706 ++++++++
 ...ink-Implement-callbacks-for-version-5-of-.patch |   65 -
 ...aylandsink-Fix-scale-up-with-padded-video.patch |   39 -
 .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   42 +
 ...d =3D> gstreamer1.0-plugins-good_1.12.2.bbappend} |    0
 21 files changed, 1181 insertions(+), 4551 deletions(-)  create mode 10064=
4 meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland=
-drm-Add-wayland-drm-protocol-to-stable.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-prot=
ocols_1.10.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst=
reamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progre=
ssiv.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0002-kmssink-remove-DCE-dependencies.patch
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad/{0002-parsers-Pick-previos-bug-fixes-on-different-parsers.patch =3D> 0=
002-parsers-bug-fixes-on-parsers.patch} (85%)  delete mode 100644 meta-arag=
o-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-gstkmss=
ink-Add-support-for-KMS-based-sink.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.pat=
ch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.=
patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad_1.12.2.bbappend
 copy meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-=
good_1.8.3.bbappend =3D> gstreamer1.0-plugins-good_1.12.2.bbappend} (100%)

--
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

