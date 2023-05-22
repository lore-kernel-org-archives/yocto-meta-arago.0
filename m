Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1D4C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:36:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3098.1684780605009610735
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PIIAuhJo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MIadpf029748;
	Mon, 22 May 2023 13:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684780599;
	bh=NjnHJW9KHBUDAU8+wB/bd/xsSy0Er5GcBWgJxAclf7E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PIIAuhJoZeSSqUY71EVo12J0xMZYUDhMcYiBVGCLkxVRaAGX1YAPa9QdcTfplgSCz
	 S+teEj1pJ91gzuKEt2Ummn/qAGNSe03XvmserinsS8W9UvpNWybuqNduqMjlvpjEl+
	 gr5s9yyRa3wq98SI/3/yMh9BVmzULPS+1Gy5YUuE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MIadV3015599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 13:36:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 13:36:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 13:36:39 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MIadqj006654;
	Mon, 22 May 2023 13:36:39 -0500
Message-ID: <06b30684-502d-fff3-aa96-1ad458c9759d@ti.com>
Date: Mon, 22 May 2023 13:36:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [PATCH] recipes-graphics: wayland: Add systemd
 service to launch weston on boot
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>,
        Sai Sree Kartheek Adivi
	<s-adivi@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta
	<g-gupta@ti.com>
References: <20230522171155.15200-1-c-shilwant@ti.com>
 <20230522173442.GW9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230522173442.GW9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 18:36:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14429

On 5/22/23 12:34, Denys Dmytriyenko wrote:
> On Mon, May 22, 2023 at 10:41:55PM +0530, Chirag Shilwant wrote:
>> - openembedded-core:kirkstone added a condition to package weston init.d
>> script only when VIRTUAL-RUNTIME_init_manager isn't systemd which wasn't in
>> dunfell. Hence, manually install and ship the weston init.d script.
>>
>> - Add weston-init.service file which is a systemd service which will launch
>> the weston init.d script. Make this service file run on boot by adding it to
>> SYSTEMD_SERVICE.
>>
>> - Reassign INITSCRIPT_NAME and INITSCRIPT_PARAMS values to nothing as
>> weston-init.service will now be the service file.
> 
> 1. Why do you need to do this dance? Doesn't systemd-compat-units do that for
> you already?
> 
> 2. The plan is to convert to rootless execution of weston and hence most if
> not all of this code will be replaced anyway.
> 
> 
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   .../wayland/weston-init.bbappend              | 20 ++++++++++++++-----
>>   .../wayland/weston-init/weston-init.service   | 10 ++++++++++
>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service
>>
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
>> index 28e7ae39..c294fba4 100644
>> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
>> @@ -1,23 +1,33 @@
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>   
>> -PR:append = ".arago12"
>> +PR:append = ".arago13"
>>   
>>   SRC_URI:append = " \
>>       file://runWeston \
>>       file://wayland_env.sh \
>>       file://weston.ini \
>> +    file://weston-init.service \
>>   "
>>   
>>   do_install:append() {
>>       install -d ${D}${bindir}
>>       install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
>>       rm -rf ${D}${systemd_system_unitdir}
>> -
>> +
>>       install -d ${D}${sysconfdir}/profile.d
>>       install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
>>       install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
>> +    install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
>> +    sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
>> +
>> +    install -d ${D}${sysconfdir}/systemd/system
>> +    install -D -p -m0644 ${WORKDIR}/weston-init.service ${D}${sysconfdir}/systemd/system/weston.service
>> +    install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${sysconfdir}/systemd/system
>>   }
>>   
>> -FILES:${PN}:remove = "${systemd_system_unitdir}/weston.service ${systemd_system_unitdir}/weston.socket"
>> -FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
>> -SYSTEMD_SERVICE:${PN}:remove = "weston.service weston.socket"
>> +FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini ${sysconfdir}/systemd/system/weston.service ${sysconfdir}/systemd/system/weston.socket"
>> +
>> +SYSTEMD_SERVICE:${PN} = "weston.service"
>> +
>> +INITSCRIPT_NAME = ""
>> +INITSCRIPT_PARAMS = ""
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service
>> new file mode 100644
>> index 00000000..d4c7d472
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service
>> @@ -0,0 +1,10 @@
>> +[Unit]
>> +Description=Systemd Service to Start Weston
>> +
>> +[Service]
>> +Type=forking
>> +ExecStart=/etc/init.d/weston start
>> +StandardOutput=journal
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> -- 
>> 2.34.1

Chirag, hold off on this for now. I've got a series cleaning up a lot of 
graphics patches in Weston, Qt, and the likes that also addresses this. 
It likely won't make 9.0 but it's still in the works.

