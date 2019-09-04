Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2392252960
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2019 12:58:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84CvfJ3029221
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 07:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567601861;
	bh=hLPCEXNqqXbs6tbAJIi7JcA0J9rQyMseuwBU2F5Uolg=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=IT/Ka0B5hP3z9wTTe/9ZnEDv57IR0nPUJgLxAbPOYn0mMHBFeMl6tgnEtuLizQrmT
	k3o21CpvsOhNNI3O06PJvTPwAPu6Ic4tsmulOgfmJyc+0/Dd85NRK7gH0uLhjguBbV
	NnznQb2HJTuB6JrtsB0WwPgQpiiAjTJcqXHDsdUA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84Cvffx011945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 07:57:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 4 Sep 2019 07:57:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 4 Sep 2019 07:57:40 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CvdHI051137;
	Wed, 4 Sep 2019 07:57:40 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1567542009-38879-1-git-send-email-denys@ti.com>
	<afe884c5-d483-0c75-5ed3-d2fe05564a41@ti.com>
Message-ID: <4cb62567-aed3-f0d3-6967-bd820d241c90@ti.com>
Date: Wed, 4 Sep 2019 08:57:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <afe884c5-d483-0c75-5ed3-d2fe05564a41@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] rng-tools: remove duplicate initscript and wait for module load
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
X-List-Received-Date: Wed, 04 Sep 2019 12:58:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I now tested this in a build. It fails when creating the rootfs. The 
update-rc.d pre/post inst is still defined in the package, so package 
configuration fails because the initscript is not found.

This can be resolved by setting INHIBIT_UPDATERCD_BBCLASS in the 
rng-tools bbappend.


- Jake

On 9/3/2019 5:22 PM, Jacob Stiffler wrote:
> I manually made these changes to an existing filesystem, rebooted a 
> few times, and observed the service status. The service was up every 
> time and there was no delay in the service terminating when rebooting.
>
> Tested-by: Jacob Stiffler <j-stiffler@ti.com>
>
> On 9/3/2019 4:20 PM, Denys Dmytriyenko wrote:
>> Since Arago still has a mix of SysVinit iniscripts and systemd unit 
>> files, it
>> enables both of the DISTRO_FEATURES, resulting in some duplication. 
>> It appears
>> that rngd currently has a problem handling signals when forked in 
>> daemon mode.
>> Hence, drop SysVinit initscript in favor of systemd service, as the 
>> latter one
>> starts rngd in foreground. Also, add udev dependency rule on omap_rng 
>> module.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   .../recipes-support/rng-tools/rng-tools/rngd.rules          | 1 +
>>   .../recipes-support/rng-tools/rng-tools_%.bbappend          | 13 
>> +++++++++++++
>>   2 files changed, 14 insertions(+)
>>   create mode 100644 
>> meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
>>   create mode 100644 
>> meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
>>
>> diff --git 
>> a/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules 
>> b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
>> new file mode 100644
>> index 0000000..a21c99b
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
>> @@ -0,0 +1 @@
>> +ACTION=="add", SUBSYSTEM=="module", KERNEL=="omap_rng", 
>> TAG+="systemd", ENV{SYSTEMD_WANTS}+="rngd.service"
>> diff --git 
>> a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend 
>> b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
>> new file mode 100644
>> index 0000000..df84536
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
>> @@ -0,0 +1,13 @@
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +PR_append = ".arago0"
>> +
>> +SRC_URI += "file://rngd.rules"
>> +
>> +do_install_append() {
>> +    # remove duplicate initscript
>> +    rm -f ${D}${sysconfdir}/init.d/rng-tools
>> +
>> +    install -d ${D}${sysconfdir}/udev/rules.d/
>> +    install -m0644 ${WORKDIR}/rngd.rules 
>> ${D}${sysconfdir}/udev/rules.d/
>> +}

