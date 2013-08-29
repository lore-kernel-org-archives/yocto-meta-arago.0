Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7439C529E4
	for <meta-arago@arago-project.org>;
	Thu, 29 Aug 2013 06:54:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7T6sdfm006853
	for <meta-arago@arago-project.org>; Thu, 29 Aug 2013 01:54:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7T6sdJZ009263
	for <meta-arago@arago-project.org>; Thu, 29 Aug 2013 01:54:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 29 Aug 2013 01:54:38 -0500
Received: from [172.24.157.63] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7T6sbT6017411;
	Thu, 29 Aug 2013 01:54:38 -0500
Message-ID: <521EF02C.7000107@ti.com>
Date: Thu, 29 Aug 2013 12:24:36 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <CF956B779D819D41BBC043B7082161D54454A4@DBDE04.ent.ti.com>
	<20130827133906.GD2339@edge>
In-Reply-To: <20130827133906.GD2339@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] configs: Lock down the GLSDK release 6.02.00.01
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
X-List-Received-Date: Thu, 29 Aug 2013 06:54:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/27/2013 7:09 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 27, 2013 at 08:11:13AM +0000, Hingolikar, Mrinmayee wrote:
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> The patch is mangled, please fix.
Oh! checked with the original patch, its not mangled.
Sending it again.
>
>> ---
>>  ....01.00-config.txt => glsdk-06.02.00-config.txt} |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)  copy configs/glsdk/{glsdk-06.01.00-config.txt => glsdk-06.02.00-config.txt} (89%)
>>
>> diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.02.00-config.txt
>> similarity index 89%
>> copy from configs/glsdk/glsdk-06.01.00-config.txt
>> copy to configs/glsdk/glsdk-06.02.00-config.txt
>> index 5708106..969bf55 100644
>> --- a/configs/glsdk/glsdk-06.01.00-config.txt
>> +++ b/configs/glsdk/glsdk-06.02.00-config.txt
>> @@ -2,9 +2,9 @@
>>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>>  
>>  bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
>> -meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=meta-arago-distro:meta-arago-extras
>> +meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,da
>> +nny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
> ^^^ Here it split in 2 lines.
>
>
>>  meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
>> -meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=
>> +meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DE
>> +V_SDK_06_02_00_01,layers=
> ^^^ And here as well.
>
>
>>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
>>  oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
>>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


-- 
Regards,
Mrinmayee


