Return-Path: <dmurphy@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D55EA52A5A
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 20:30:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OKUb8c027164
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493065837;
	bh=0Pyd4PIJ5aUgMehom+vKtGPDe1BRoPDiAjCUkpx4tYA=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=hFAJJeGhVr87NrNyBAXrAsATERGyiteMYYrLNLbveMpnHi8XNKktOMji5bA7PPf8S
	558rqaKrTnxIhnIXTQwTKVj9hJLVjWbLpmwxXsDcoxsVfddXsjV+btroxkHm7iViOH
	V/9O3liqnLs6rG9lXoAI2M0R1k1HGYhyR53qXcAM=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKUbpA028161
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:30:37 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 15:30:36 -0500
Received: from [172.22.92.18] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKUbKg006268;
	Mon, 24 Apr 2017 15:30:37 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20170424193843.1759-1-dmurphy@ti.com>
	<20170424202527.GC30097@edge>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <3d750405-374e-d924-1583-1ee8d538520d@ti.com>
Date: Mon, 24 Apr 2017 15:30:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170424202527.GC30097@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Mon, 24 Apr 2017 20:30:39 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

On 04/24/2017 03:25 PM, Denys Dmytriyenko wrote:
> Dan,
> 
> On Mon, Apr 24, 2017 at 02:38:43PM -0500, Dan Murphy wrote:
>> Updating the SRCREV for the optee-client,
>> optee-os and optee-test to align with Linaro's
>> code base and kernel driver.  For the 2017.01-rc1
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
>>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
>>  meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> index 3a24c60..df7587d 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> @@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
>>             file://tee-supplicant.service"
>>  
>>  BRANCH = "ti_optee_client"
>> -SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
>> +SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index c50c47d..4fa39de 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>  "
>>  BRANCH = "ti_optee_os"
>> -SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
>> +SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"
> 
> This SRCREV is incorrect.

Yes you are correct I was looking at the -next branch when I added the rev

V2 on its way

> 
> 
>>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> index a94cd42..3ab6177 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> @@ -3,4 +3,4 @@ PR_append = ".arago1"
>>  SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
>>  
>>  BRANCH = "ti_optee_test"
>> -SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
>> +SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
>> -- 
>> 1.9.1
>>


-- 
------------------
Dan Murphy

