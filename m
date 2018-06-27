Return-Path: <karthik.ramanan@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B5E73529CE
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 16:20:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RGKPBS016117
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 11:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530116425;
	bh=7g6+ipqb0DVaUcg9CsJDm63yv2LLYUbw6zfw+X7k0ug=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=LV/OI8+XfenkSGWwdAjYQTvKqJh9FguDQPpep4OjwobWAJgWlcMv0RJo9lC8+yLZQ
	x60Nii21iWBBpluOwqBtpQh2yoTOTwPn9Pjeoc/5zMTOPGYnN4ZPaL2Ia57CAPM3bi
	aCm8JqRPQERFlKA3Cx6pYn7xj7eM2WCaw4GgdHZM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RGKPdI025217
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 11:20:25 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 11:20:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 11:20:24 -0500
Received: from [172.22.219.60] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RGKMlp000334;
	Wed, 27 Jun 2018 11:20:23 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1530087529-102302-1-git-send-email-a0393906@ti.com>
	<1530087529-102302-2-git-send-email-a0393906@ti.com>
	<20180627155441.GZ3163@beryl>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <70d4530f-dde9-5068-e857-1f1b756e7d67@ti.com>
Date: Wed, 27 Jun 2018 21:50:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180627155441.GZ3163@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko 2/3] wayland-ivi-extension: Update to version 2.1.0
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
X-List-Received-Date: Wed, 27 Jun 2018 16:20:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 27-Jun-18 9:24 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 27, 2018 at 01:48:48PM +0530, Karthik Ramanan wrote:
>> This version is compatible with weston 2.0.0
>>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   ...yland-ivi-extension_1.11.0.bb => wayland-ivi-extension_2.1.0.bb} | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>   rename meta-arago-distro/recipes-graphics/wayland/{wayland-ivi-extension_1.11.0.bb => wayland-ivi-extension_2.1.0.bb} (80%)
>>
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
>> similarity index 80%
>> rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
>> rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
>> index 75e284f..894d1b8 100644
>> --- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
>> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
>> @@ -5,12 +5,10 @@ BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Exten
>>   LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
>>   
>> -SRCREV = "c9001582b10ce209c37b42dd560947c5aa8928b3"
>> +SRCREV = "d2c2e262f3bdc9db33b3014293fcdbcfdc90ab27"
>>   
>>   SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
>>              file://force-type-conversion.patch \
>> -           file://0001-layer-add-surfaces-Add-screenId-as-an-argument.patch \
>> -           file://0002-layer-add-surfaces-surface-layer-management.patch \
> Now that this is a diff, it clearly reveals that these 2 patches are no
> longer used - do you want to remove them?
This was intentionally left behind. So lets not remove it at the moment.
These two patches were additions by TI to the wayland-ivi-extension. I 
still need more time to determine how and in what form these changes 
have made its way into the upstream.
Lets keep it for now and I am looking into reworking/removing them from 
here soon.
>
>
>>       "
>>   
>>   S = "${WORKDIR}/git"
>> @@ -26,7 +24,7 @@ FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
>>   
>>   EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
>>   
>> -PR = "r3"
>> +PR = "r1"
>>   
>>   # Need these temporarily to prevent a non-fatal do_package_qa issue
>>   INSANE_SKIP_${PN} += "dev-deps"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


