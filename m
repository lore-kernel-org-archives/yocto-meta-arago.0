Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 47675529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:19:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JIcAs026383
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:18:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931918;
	bh=ZuvrkBXo1xW3VvGpwcEa4JHUSpoeD4xw9XVN6vcUANQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fejNXGrEQitCA4vacuR4gJz/hcUOkbV3P1Y0Cv1jsds4efbAz99liqUL8pi5/Ds4e
	2xe2HlFlbDbWV5asBS6xOOnRfBXL7KoakNd9d8GsUNRUV+/5kLU5prpH5Rd5QgiJnq
	KvPuXxGwprKjcDMHalkL1pgsNuB/AYU0F5KypOUM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JIchQ018378
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:18:38 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:18:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:18:38 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JIbtu017407;
	Thu, 1 Mar 2018 13:18:38 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1519931086-26137-1-git-send-email-j-stiffler@ti.com>
	<20180301191508.GP22424@edge>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2f3e938f-de78-047d-6023-9e08bee56a85@ti.com>
Date: Thu, 1 Mar 2018 14:18:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180301191508.GP22424@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ti-tisdk-setup: bump SRCREV to latest
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
X-List-Received-Date: Thu, 01 Mar 2018 19:19:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/1/2018 2:15 PM, Denys Dmytriyenko wrote:
> Which branch?

Sorry, forgot to specify on this one. Please accept for morty, rocko, 
and master.

> On Thu, Mar 01, 2018 at 02:04:46PM -0500, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>> index 175fc3a..425bba6 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
>> @@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
>>   LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>>   
>> -PR = "r32"
>> +PR = "r33"
>>   
>>   BRANCH ?= "master"
>> -SRCREV = "1f2ce6e8d389ec32e1abbe80354c55f6e7259fc0"
>> +SRCREV = "2184048a4a01a338f9e839ffb39663805a4e7a58"
>>   SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>>   
>>   S = "${WORKDIR}/git/"
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


