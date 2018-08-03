Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A96C152985
	for <meta-arago@arago-project.org>;
	Fri,  3 Aug 2018 11:42:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w73BglWk060620
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 06:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533296567;
	bh=/r8TeThkTwlCpWbkDhvEpncdWMnJRyNARJZtKvTacqY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=dETOfW52KO26/znQGzdvSZCmDWEEhKxfKBkIbaTFcFni2w0OfzerwkQ3yDEQpRSDi
	/jPjsKN39QnKv8Hupa/LK4egvZVjmtvj0H8wZaxnmWMkXPPlJSIHwAW2dan6yBHjWf
	EMTdd23A7tAkyBC+Jg1aN3soHJBRNqCvCHtIPWq4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w73Bgll9028130
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 06:42:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 3 Aug 2018 06:42:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 3 Aug 2018 06:42:47 -0500
Received: from [172.22.161.114] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w73Bgkqb002420;
	Fri, 3 Aug 2018 06:42:47 -0500
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <20180802185959.24811-1-dmurphy@ti.com>
	<29767ab9fcb44c3cbd9db74a4a41ac36@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0865fc76-c513-56a1-92e3-9f243568c600@ti.com>
Date: Fri, 3 Aug 2018 06:42:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <29767ab9fcb44c3cbd9db74a4a41ac36@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1 tag
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
X-List-Received-Date: Fri, 03 Aug 2018 11:42:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 08/02/2018 05:47 PM, Dmytriyenko, Denys wrote:
> ERROR: optee-os-3.2.0+gitAUTOINC+48952f9f76-r0.arago0 do_fetch: Fetcher failure: Unable to find revision 48952f9f76d885df4cb65f8479a4cf7dedf0ee54 in branch master even from upstream
> 

What was the issue you had to correct?  The Commit sha looks correct

Dan

> 
>> -----Original Message-----
>> From: Murphy, Dan
>> Sent: Thursday, August 2, 2018 3:00 PM
>> To: meta-arago@arago-project.org
>> Cc: Dmytriyenko, Denys; Murphy, Dan
>> Subject: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1 tag
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  .../recipes-security/optee/optee-client.bbappend              | 4 ++--
>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>  .../recipes-security/optee/optee-test_git.bbappend            | 2 +-
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> index bb1f631d..52a6f588 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> @@ -5,7 +5,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-
>> client.git;branch=${BRANCH} \
>>
>>  LIC_FILES_CHKSUM =
>> "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>>
>> -PV = "3.0.0+git${SRCPV}"
>> +PV = "3.2.0+git${SRCPV}"
>>
>>  BRANCH = "ti_optee_client"
>> -SRCREV = "09b69afa5e9e74aac39e383d74f14b4d61c90476"
>> +SRCREV = "2d542f2074223fde918e68efa4a9ff37f927e604"
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index 655bd02e..ffbf0aeb 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>
>>  PR_append = ".arago0"
>>
>> -PV = "3.1.0+git${SRCPV}"
>> +PV = "3.2.0+git${SRCPV}"
>>
>>  is_armv7 = "1"
>>  is_armv7_aarch64 = "0"
>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-
>> os.git;branch=${BRANCH} \
>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>  "
>>  BRANCH = "master"
>> -SRCREV = "940a24375ba5357d34fea7196dba48eadaee9abd"
>> +SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>>
>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> index e6d10735..f85c719b 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> @@ -6,7 +6,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-
>> test.git;branch=${BRANCH}"
>>
>>  SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-
>> se.patch"
>>
>> -PV = "3.1.0+git${SRCPV}"
>> +PV = "3.2.0+git${SRCPV}"
>>
>>  BRANCH = "ti_optee_test"
>>  SRCREV = "b284eedf4fa20c21403ececfe0a47af55fbaa5d8"
>> --
>> 2.17.0.582.gccdcbd54c
> 


-- 
------------------
Dan Murphy

