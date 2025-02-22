Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B010C021B3
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 02:54:00 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.39778.1740192833061949441
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 18:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I6QosaZE;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51M2rn8O1002608
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 20:53:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740192829;
	bh=K3XAMe/uJPPRbD1FfhutuTmcPrXq3Za+SlDzT6d+egw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I6QosaZEpdLYd/4g9KMWb5o/vDtphyjRsmGNrwZ3JM343lRzUCBylmdQVHRhoMExb
	 E1tt5wGOEHPuriRP3LPpqlit0pJzMGMD0VhhD6YTZftm2Y8NJFHpUTA6bYhIkHB8hh
	 BewYbDKGdQoqsBzjaQl6YcRnVGAtPOEtIL+7/twQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51M2rnDL116319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Feb 2025 20:53:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 20:53:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 20:53:49 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51M2rmwG039401;
	Fri, 21 Feb 2025 20:53:48 -0600
Message-ID: <6fd6c8a9-c5fe-4188-9e37-84ee294830c4@ti.com>
Date: Fri, 21 Feb 2025 20:53:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add recipe for
 NNStreamer
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250222015358.3543400-1-afd@ti.com>
 <20250222022557.GD1879@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250222022557.GD1879@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Feb 2025 02:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15901

On 2/21/25 8:25 PM, Denys Dmytriyenko wrote:
> On Fri, Feb 21, 2025 at 07:53:58PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> NNStreamer is an efficient and flexible stream pipeline framework for
>> complex neural network applications.
>>
>> NNStreamer provides a set of GStreamer plugins so developers may apply
>> neural networks, attach related frameworks (including ROS, IIO,
>> FlatBuffers, and Protocol Buffers), and manipulate tensor data streams
>> in GStreamer pipelines easily and execute such pipelines efficiently.
>>
>> It was initially developed by Samsung and then transferred to LF AI
>> Foundation as an incubation project.
> 
> FWIW, nnstreamer project on github has its own meta-neural-network layer with
> a corresponding nnstreamer recipe:
> https://github.com/nnstreamer/meta-neural-network
> https://github.com/nnstreamer/meta-neural-network/blob/master/recipes-nnstreamer/nnstreamer/nnstreamer_2.4.2.bb
> 

I did find that earlier when looking for existing recipes for this
framework, but that recipe needs some work. That layer also pulls
in a bunch of other stuff we don't need/want.

I did use that as a kicking-off point. I'll try to push back my
fixes at some point. Maybe we can work to move that into a more
common layer.

> 
>> Learn more at https://nnstreamer.ai/
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../nnstreamer/nnstreamer_2.4.0.bb            | 68 +++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>> new file mode 100644
>> index 00000000..55de11e8
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>> @@ -0,0 +1,68 @@
>> +SUMMARY = "NNStreamer, Stream Pipeline Paradigm for Nerual Network Applications"
>> +DESCRIPTION = "NNStreamer is a set of Gstreamer plugins that allow Gstreamer developers to adopt neural network models easily and efficiently."
>> +LICENSE = "LGPL-2.1-only"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
>> +
>> +SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
>> +PV = "2.4.0+git"
>> +SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig
>> +
>> +DEPENDS = " \
>> +	orc-native \
>> +	glib-2.0 \
>> +	gstreamer1.0 \
>> +	gstreamer1.0-plugins-base \
>> +	python3 \
>> +	python3-numpy \
>> +	json-glib \
>> +"
>> +
>> +PACKAGECONFIG ??= " \
>> +	protobuf \
>> +	flatbuffers \
>> +	tests \
>> +	armnn \
>> +	onnxruntime \
>> +	tensorflow-lite \
>> +"
>> +
>> +PACKAGECONFIG[tests] = "-Denable-test=true -Dinstall-test=true, -Denable-test=false, gtest"
>> +PACKAGECONFIG[protobuf] = "-Dprotobuf-support=enabled, -Dprotobuf-support=disabled, protobuf protobuf-native"
>> +PACKAGECONFIG[flatbuffers] = "-Dflatbuf-support=enabled, -Dflatbuf-support=disabled, flatbuffers flatbuffers-native"
>> +PACKAGECONFIG[armnn] = "-Darmnn-support=enabled, -Darmnn-support=disabled, armnn"
>> +PACKAGECONFIG[onnxruntime] = "-Donnxruntime-support=enabled, -Donnxruntime-support=disabled, onnxruntime"
>> +PACKAGECONFIG[tensorflow-lite] = "-Dtflite2-support=enabled, -Dtflite2-support=disabled, tensorflow-lite"
>> +
>> +do_install:append() {
>> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>> +
>> +	# Install test data
>> +	install -d ${D}/${bindir}/unittest-nnstreamer/tests
>> +	cp $CP_ARGS ${S}/tests/test_models ${D}/${bindir}/unittest-nnstreamer/tests
>> +	rm -f ${D}/${bindir}/unittest-nnstreamer/tests/test_models/models/tvm*
>> +}
>> +
>> +FILES:${PN} += "\
>> +	${libdir}/*.so \
>> +	${libdir}/gstreamer-1.0/*.so \
>> +	${libdir}/nnstreamer/* \
>> +	${sysconfdir}/nnstreamer.ini \
>> +"
>> +INSANE_SKIP:${PN} += "dev-so"
>> +
>> +PACKAGES =+ "${PN}-tests"
>> +
>> +FILES:${PN}-tests += "\
>> +	${libdir}/nnstreamer/customfilters/* \
>> +	${bindir}/unittest-nnstreamer/* \
>> +"
>> +
>> +FILES:${PN}-dev = "\
>> +	${includedir}/nnstreamer/* \
>> +	${libdir}/*.a \
> 
> FWIW, these get automatically packaged into ${PN}-staticdev
> 

Let me remove this and see where those go.

Andrew

> 
>> +	${libdir}/pkgconfig/*.pc \
>> +"
>> -- 
>> 2.39.2

