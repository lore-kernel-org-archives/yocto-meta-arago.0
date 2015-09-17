Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E405A529FB
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 20:29:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HKTZp8019528
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 15:29:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HKTZH8030984
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 15:29:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Sep 2015 15:29:35 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HKTVsM004460;
	Thu, 17 Sep 2015 15:29:33 -0500
Message-ID: <55FB22AA.4030306@ti.com>
Date: Thu, 17 Sep 2015 16:29:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
	<20150917201402.GG18085@edge>
In-Reply-To: <20150917201402.GG18085@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] ti-tisdk-makefile: Source ENV_SETUP for certain apps
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
X-List-Received-Date: Thu, 17 Sep 2015 20:29:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/17/2015 4:14 PM, Denys Dmytriyenko wrote:
> Jake,
>
> Do you need these 4 patches now?

Nope.

> On Wed, Sep 16, 2015 at 01:14:56PM -0400, Jacob Stiffler wrote:
>> * In moving to the latest toolchain (2015.05) the linker cannot find
>>    standard toolchain libraries without help.
>> * Use the environment-setup script from the devkit to set the
>>    appropriate CFLAGS and LDFLAGS
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo             | 2 +-
>>   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks         | 2 +-
>>   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example       | 2 +-
>>   .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples     | 2 +-
>>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
>> index 445dd10..9d56246 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
>> @@ -3,7 +3,7 @@ am-sysinfo:
>>   	@echo =============================
>>   	@echo    Building AM Sysinfo
>>   	@echo =============================
>> -	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make
>> +	@cd example-applications; cd `find . -name "*am-sysinfo*"`; . $(ENV_SETUP); make
>>   
>>   am-sysinfo_clean:
>>   	@echo =============================
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
>> index 0447ea5..2337550 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
>> @@ -3,7 +3,7 @@ arm-benchmarks:
>>   	@echo =============================
>>   	@echo    Building ARM Benchmarks
>>   	@echo =============================
>> -	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make
>> +	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; . $(ENV_SETUP); make
>>   
>>   arm-benchmarks_clean:
>>   	@echo =============================
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
>> index c7a4385..bc117c0 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
>> @@ -3,7 +3,7 @@ oprofile-example:
>>   	@echo =============================
>>   	@echo    Building OProfile Example
>>   	@echo =============================
>> -	@cd example-applications; cd `find . -name "*oprofile-example*"`; make
>> +	@cd example-applications; cd `find . -name "*oprofile-example*"`; . $(ENV_SETUP); make
>>   
>>   oprofile-example_clean:
>>   	@echo =============================
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
>> index 9ab9616..d166245 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
>> @@ -3,7 +3,7 @@ ti-crypto-examples:
>>   	@echo =================================
>>   	@echo    Building TI Crypto Examples
>>   	@echo =================================
>> -	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make release
>> +	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; . $(ENV_SETUP); make release
>>   
>>   ti-crypto-examples_clean:
>>   	@echo =================================
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>> index a770117..4947c94 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>> @@ -41,7 +41,7 @@ SRC_URI = "\
>>       file://Makefile_omapdrm-pvr \
>>   "
>>   
>> -PR = "r51"
>> +PR = "r52"
>>   
>>   MAKEFILES_COMMON = "linux \
>>                       matrix-gui \
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


