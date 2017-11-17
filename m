Return-Path: <x0038811@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3701452A0C
	for <meta-arago@arago-project.org>;
	Fri, 17 Nov 2017 09:04:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAH9430X027722
	for <meta-arago@arago-project.org>; Fri, 17 Nov 2017 03:04:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510909443;
	bh=qfQAN8k2Mpb8EMX8h5vfkcpenh2EA/VamJBwJCWvStQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=k92U79uJgHMzCBT29K0gUN/ZjQagnmIEvZ+zQquOaH4dTkVkw+deS9rRq0GPsFZcD
	Is1ZPfQFYmDA8y+0xyXu+u7fZ0zs2+7crj8+jnlnWYWLnZuNTi/Uw1IMKbCzysatLi
	MnBuBt0CnuFwEYUbvkOmPwcnXYHGtuMZu/X3KBUk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAH942t0025440
	for <meta-arago@arago-project.org>; Fri, 17 Nov 2017 03:04:02 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 17 Nov 2017 03:04:02 -0600
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.0845.034; Fri, 17 Nov 2017 03:04:01 -0600
From: "Prasad, Ram" <x0038811@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty PATCH V5] gstreamer1.0*-good: Increase
	v4l2src minimum buffers by 4
Thread-Index: AQHTXrzp26NfDAxsOEGkZicmqhEinqMX428AgABk9MA=
Date: Fri, 17 Nov 2017 09:04:01 +0000
Message-ID: <0a1c3d421e7c4f6ba4ee837f4d250abe@ti.com>
References: <1510824355-26185-1-git-send-email-x0038811@ti.com>
	<20171116210208.GC32707@edge>
In-Reply-To: <20171116210208.GC32707@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.12]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty PATCH V5] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Fri, 17 Nov 2017 09:04:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
Yes, this patch is upstreamable.

Thanks
Ramprasad

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, November 17, 2017 2:32 AM
To: Prasad, Ram
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty PATCH V5] gstreamer1.0*-good: Increase v4l=
2src minimum buffers by 4

Is this patch upstreamable?


On Thu, Nov 16, 2017 at 02:55:55PM +0530, Ramprasad N wrote:
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>  ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++=
++++++
>  .../gstreamer1.0-plugins-good_1.8.3.bbappend       |  8 ++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644=20
> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go
> od/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
>  create mode 100644=20
> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go
> od_1.8.3.bbappend
>=20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> new file mode 100644
> index 0000000..1af90c1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> +++ ins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> @@ -0,0 +1,33 @@
> +From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00=20
> +2001
> +From: Ramprasad N <x0038811@ti.com>
> +Date: Fri, 13 Oct 2017 15:48:06 +0530
> +Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
> +
> +v4l2src plugin allocates 4 buffers for the pipeline.
> +To capture video in realtime the pipeline without frameloss, four=20
> +buffers are not sufficient. Increase the number of buffers by 4 more.
> +
> +Signed-off-by: Ramprasad N <x0038811@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c=20
> +index 549e06f..773f46d 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object *=
 obj, GstQuery * query)
> +      * to fill the pipeline, the minimum required to decoder according =
to the
> +      * driver and 1 more, so we don't endup up with everything downstre=
am or
> +      * held by the decoder. */
> +-    own_min =3D min + obj->min_buffers + 1;
> ++    /* Increase the number of buffers required by 4 more to capture vid=
eo in
> ++     * realtime. With default number of 4 buffers, frame loss is observ=
ed */
> ++    own_min =3D min + obj->min_buffers + 5;
> +=20
> +     /* If no allocation parameters where provided, allow for a little m=
ore
> +      * buffers and enable copy threshold */
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> good_1.8.3.bbappend=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> good_1.8.3.bbappend
> new file mode 100644
> index 0000000..29a07b2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> +++ ins-good_1.8.3.bbappend
> @@ -0,0 +1,8 @@
> +PR_append =3D ".arago0"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI +=3D " \
> +      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
> +      "
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

