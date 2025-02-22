Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05516C021B3
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 02:26:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.39475.1740191162781655457
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 18:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D59040D2A;
	Sat, 22 Feb 2025 02:26:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veGEIO3mvzLc; Sat, 22 Feb 2025 02:26:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BFAD840CF7;
	Sat, 22 Feb 2025 02:25:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 287C716428D; Fri, 21 Feb 2025 21:25:57 -0500 (EST)
Date: Fri, 21 Feb 2025 21:25:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add recipe
 for NNStreamer
Message-ID: <20250222022557.GD1879@denix.org>
References: <20250222015358.3543400-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222015358.3543400-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Feb 2025 02:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15899

On Fri, Feb 21, 2025 at 07:53:58PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> NNStreamer is an efficient and flexible stream pipeline framework for
> complex neural network applications.
> 
> NNStreamer provides a set of GStreamer plugins so developers may apply
> neural networks, attach related frameworks (including ROS, IIO,
> FlatBuffers, and Protocol Buffers), and manipulate tensor data streams
> in GStreamer pipelines easily and execute such pipelines efficiently.
> 
> It was initially developed by Samsung and then transferred to LF AI
> Foundation as an incubation project.

FWIW, nnstreamer project on github has its own meta-neural-network layer with 
a corresponding nnstreamer recipe:
https://github.com/nnstreamer/meta-neural-network
https://github.com/nnstreamer/meta-neural-network/blob/master/recipes-nnstreamer/nnstreamer/nnstreamer_2.4.2.bb


> Learn more at https://nnstreamer.ai/
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../nnstreamer/nnstreamer_2.4.0.bb            | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> new file mode 100644
> index 00000000..55de11e8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> @@ -0,0 +1,68 @@
> +SUMMARY = "NNStreamer, Stream Pipeline Paradigm for Nerual Network Applications"
> +DESCRIPTION = "NNStreamer is a set of Gstreamer plugins that allow Gstreamer developers to adopt neural network models easily and efficiently."
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
> +
> +SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
> +PV = "2.4.0+git"
> +SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> +
> +DEPENDS = " \
> +	orc-native \
> +	glib-2.0 \
> +	gstreamer1.0 \
> +	gstreamer1.0-plugins-base \
> +	python3 \
> +	python3-numpy \
> +	json-glib \
> +"
> +
> +PACKAGECONFIG ??= " \
> +	protobuf \
> +	flatbuffers \
> +	tests \
> +	armnn \
> +	onnxruntime \
> +	tensorflow-lite \
> +"
> +
> +PACKAGECONFIG[tests] = "-Denable-test=true -Dinstall-test=true, -Denable-test=false, gtest"
> +PACKAGECONFIG[protobuf] = "-Dprotobuf-support=enabled, -Dprotobuf-support=disabled, protobuf protobuf-native"
> +PACKAGECONFIG[flatbuffers] = "-Dflatbuf-support=enabled, -Dflatbuf-support=disabled, flatbuffers flatbuffers-native"
> +PACKAGECONFIG[armnn] = "-Darmnn-support=enabled, -Darmnn-support=disabled, armnn"
> +PACKAGECONFIG[onnxruntime] = "-Donnxruntime-support=enabled, -Donnxruntime-support=disabled, onnxruntime"
> +PACKAGECONFIG[tensorflow-lite] = "-Dtflite2-support=enabled, -Dtflite2-support=disabled, tensorflow-lite"
> +
> +do_install:append() {
> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +	# Install test data
> +	install -d ${D}/${bindir}/unittest-nnstreamer/tests
> +	cp $CP_ARGS ${S}/tests/test_models ${D}/${bindir}/unittest-nnstreamer/tests
> +	rm -f ${D}/${bindir}/unittest-nnstreamer/tests/test_models/models/tvm*
> +}
> +
> +FILES:${PN} += "\
> +	${libdir}/*.so \
> +	${libdir}/gstreamer-1.0/*.so \
> +	${libdir}/nnstreamer/* \
> +	${sysconfdir}/nnstreamer.ini \
> +"
> +INSANE_SKIP:${PN} += "dev-so"
> +
> +PACKAGES =+ "${PN}-tests"
> +
> +FILES:${PN}-tests += "\
> +	${libdir}/nnstreamer/customfilters/* \
> +	${bindir}/unittest-nnstreamer/* \
> +"
> +
> +FILES:${PN}-dev = "\
> +	${includedir}/nnstreamer/* \
> +	${libdir}/*.a \

FWIW, these get automatically packaged into ${PN}-staticdev


> +	${libdir}/pkgconfig/*.pc \
> +"
> -- 
> 2.39.2

