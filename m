Return-Path: <x0038811@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 838FB5203A
	for <meta-arago@arago-project.org>;
	Mon, 26 Mar 2018 10:38:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2QAc33Z018147
	for <meta-arago@arago-project.org>; Mon, 26 Mar 2018 05:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522060683;
	bh=cHRZJQBC7natwR1Q+bqD49S2FKbHYeYvJFO0fs7p5Dc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jV3M1UpKnrZsIB+urZPVKfc/y4M6jS9DfDlxpahceOUU29rXIVeUnzzzYxg7DIgbz
	JmPEjtsBfYM209rTjY6Veb7Npqbo2MuGM71TiGbWAkZEeuLaFKIYMrVfXYvGhg/6xE
	oorqgFg2x14tla7LPJGX01ZdRgWmmRaYvX14JlFM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2QAc39M023236
	for <meta-arago@arago-project.org>; Mon, 26 Mar 2018 05:38:03 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 26 Mar 2018 05:38:03 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1261.035; Mon, 26 Mar 2018 05:38:02 -0500
From: "Prasad, Ram" <x0038811@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko 1/9] gstreamer1.0*-bad: Clean up gstreamer
	1.8 bad patches
Thread-Index: AQHTwZM13wyaSXwLhEmuH2VnhNVkOaPiDqmAgABLLiA=
Date: Mon, 26 Mar 2018 10:38:02 +0000
Message-ID: <e10b8425c9b34a1fbaddfe27458fcc94@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
	<1521691605-49259-2-git-send-email-x0038811@ti.com>
	<20180326010848.GA20556@edge>
In-Reply-To: <20180326010848.GA20556@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.223]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko 1/9] gstreamer1.0*-bad: Clean up gstreamer 1.8 bad patches
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
X-List-Received-Date: Mon, 26 Mar 2018 10:38:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
We internally discussed the option of overwriting the existing patches inst=
ead of cleaning.
But only two patches have rebase changes and rest all patches will not be a=
pplicable on gst1.12
hence we decided to clean all patches and create new patches.

Thanks
Ramprasad

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, March 26, 2018 6:39 AM
To: Prasad, Ram
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko 1/9] gstreamer1.0*-bad: Clean up gstreamer=
 1.8 bad patches

Are the new patches so much different that it doesn't make sense to just up=
date them?


On Thu, Mar 22, 2018 at 09:36:37AM +0530, Ramprasad N wrote:
> Remove all gstreamer bad patches. New rebased patches will
> be created instead of overwriting on the existing patches
>=20
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>  ...-mouse-movement-for-videos-on-waylandsink.patch |  404 -----
>  ...gstdrmallocator-Add-DRM-allocator-support.patch |  482 ------
>  ...ylandsink-Add-mouse-drag-and-drop-support.patch |  408 -----
>  ...waylandsink-add-input-format-I420-support.patch |   89 -
>  .../0002-kmssink-remove-DCE-dependencies.patch     |   96 --
>  ...ck-previos-bug-fixes-on-different-parsers.patch |  146 --
>  ...gstkmssink-Add-support-for-KMS-based-sink.patch | 1592 --------------=
----
>  .../0003-kmssink-add-YUYV-support.patch            |   81 -
>  ...aylandsink-Add-DRM-support-on-waylandsink.patch | 1728 --------------=
------
>  ...ink-Implement-callbacks-for-version-5-of-.patch |   65 -
>  ...aylandsink-Fix-scale-up-with-padded-video.patch |   39 -
>  11 files changed, 5130 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.pat=
ch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patc=
h
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0002-kmssink-remove-DCE-dependencies.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0002-parsers-Pick-previos-bug-fixes-on-different-parsers=
.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0003-gstkmssink-Add-support-for-KMS-based-sink.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of=
-.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
>=20

