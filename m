Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7378F529E8
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 15:12:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UFAxGg028521
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572448259;
	bh=Y2ilffhqUBxityAiwQAg+3C8w5msdslYSEDEJZr80y4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=KZY9RQP/nXKNgCYcIKcPFltTD9P7BnVjMwEy2vIVuMyxG50kWV+2UjtJGsNWgTyOL
	OjmPL8rIAv/3v6lpaxncDk12LVaT1ChuGeusXam0APIa9mbDW4l1hW9jcea+lmXH5b
	THzsXO346MYudaMpimt/uy8O0fzuYCbOEA10LnO8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UFAxO6129982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:10:59 -0500
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 10:10:46 -0500
To: "Andrew F. Davis" <afd@ti.com>, Eric Ruei <e-ruei1@ti.com>,
	<meta-arago@arago-project.org>
References: <20191029135349.31792-1-e-ruei1@ti.com>
	<20191029135349.31792-7-e-ruei1@ti.com>
	<8bef7e9e-b4e5-c6b2-7844-c34ffa393168@ti.com>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <047b77ef-03b4-f754-19bb-70839bfbcf73@ti.com>
Date: Wed, 30 Oct 2019 11:10:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8bef7e9e-b4e5-c6b2-7844-c34ffa393168@ti.com>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH 6/7] omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
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
X-List-Received-Date: Wed, 30 Oct 2019 15:12:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/30/2019 11:04 AM, Andrew F. Davis wrote:
> On 10/29/19 9:53 AM, Eric Ruei wrote:
>> - Replace pvr_wlegl with wayland-egl in the LDFLAGS string
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++++++++++++
>>   .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
>>   2 files changed, 34 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
>>
>> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
>> new file mode 100644
>> index 00000000..4774425f
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
>> @@ -0,0 +1,32 @@
>> +From 06b21346d662209f5ea9816f408f9f883b775d60 Mon Sep 17 00:00:00 2001
>> +From: Eric Ruei <e-ruei1@ti.com>
>> +Date: Mon, 28 Oct 2019 09:43:47 -0400
>> +Subject: [PATCH] util: Makefile.am: update LDFLAGS for Mesa-based EGL
>> +
>> +- replace pvr_wlegl with wayland-egl
>> +
>> +Upstream-Status: Pending
> 
> 
> Who owns the omapdrmtest repo? This should be a trivial fix to get in.
> 
> Andrew
> 
> 
Agree. I just want to get the initial patch in and I shall work on those 
issues.

Eric



>> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> +---
>> + util/Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> + mode change 100644 => 100755 util/Makefile.am
>> +
>> +diff --git a/util/Makefile.am b/util/Makefile.am
>> +old mode 100644
>> +new mode 100755
>> +index 2bfcb5e..fdeb877
>> +--- a/util/Makefile.am
>> ++++ b/util/Makefile.am
>> +@@ -37,7 +37,7 @@ endif
>> + if ENABLE_WAYLAND
>> + libutil_la_SOURCES += display-wayland.c wayland-drm-protocol.c viewporter-protocol.c
>> + libutil_la_CFLAGS = @DRM_CFLAGS@
>> +-libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lpvr_wlegl -lavcodec
>> ++libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lwayland-egl -lavcodec
>> +
>> + endif
>> +
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
>> index 079663e7..bb166b74 100644
>> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
>> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
>> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omap-a15|ti43x"
>>   
>>   inherit autotools pkgconfig
>>   
>> -PR = "r28"
>> +PR = "r29"
>>   SRCREV = "20338b9f575ffe9c18c12bbed41c16069d27ccf4"
>>   
>>   EXTRA_OEMAKE = "CC="${CC}""
>> @@ -17,6 +17,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>>   
>>   SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
>>           file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
>> +	file://0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch \
>>   "
>>   
>>   S = "${WORKDIR}/git"
>>


