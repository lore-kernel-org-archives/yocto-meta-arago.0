Return-Path: <anandb@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F1C95520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 12:57:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62CvBYF057783
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 07:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562072231;
	bh=7GjeryS0YRDWsD0jkvxdxxgcPsaHDUnGSE8lScj8L6A=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YY51Z13My4zRnxjyHCqnxxjZu9M2EwEvr3MUXGJp17mAd+ZelYvi+UfBYOAWKJUJz
	xP3755UkQlGVRVtHesBgv3hgQqAFi8E1qKt016XD519hpa686RUa1Hh5BbYvAYRy5A
	l3e4gu2QiFxZyGpoI3CpegdadkmPr9reyFpLyaNE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62CvBL7042070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 07:57:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 07:57:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 07:57:11 -0500
Received: from [172.24.147.151] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62Cv8vM048117;
	Tue, 2 Jul 2019 07:57:09 -0500
To: "Dmytriyenko, Denys" <denys@ti.com>, "Tammana, Gowtham" <g-tammana@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <20190629043954.7786-1-g-tammana@ti.com>
	<01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
From: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <2036ba68-d3a2-8000-6e95-51b08bc64669@ti.com>
Date: Tue, 2 Jul 2019 18:27:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
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
X-List-Received-Date: Tue, 02 Jul 2019 12:57:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We need to change kmscube, omapdrmtest, weston recipes to change DEPENDS 
on virtual/libgbm instead of libgbm. Not sure if it has been posted.

Regards,
Anand

On 02/07/19 1:14 AM, Dmytriyenko, Denys wrote:
> ERROR: Nothing PROVIDES 'libgbm' (but /OE/arago-thud-next-build/sources/meta-arago/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb DEPENDS on or otherwise requires it)
> libgbm was skipped: PREFERRED_PROVIDER_virtual/libgbm set to ti-img-rogue-umlibs, not libgbm
> NOTE: Runtime target 'kmscube' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['kmscube', 'libgbm']
> 
> 
>> -----Original Message-----
>> From: Tammana, Gowtham
>> Sent: Saturday, June 29, 2019 12:40 AM
>> To: meta-arago@arago-project.org; Dmytriyenko, Denys
>> Cc: Balagopalakrishnan, Anand; Ruei, Eric; Tammana, Gowtham
>> Subject: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provider for
>> J7
>>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-
>> arago-distro/conf/distro/include/arago-prefs.inc
>> index 939569c0..0f961322 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -23,8 +23,12 @@ PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-
>> img-rogue-driver"
>>   PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
>>
>>   # GBM (Generic Buffer Management) preferences
>> -PREFERRED_PROVIDER_libgbm = "libgbm"
>> -PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
>> +PREFERRED_PROVIDER_virtual/libgbm = "libgbm"
>> +PREFERRED_PROVIDER_virtual/libgbm-dev = "libgbm-dev"
>> +
>> +# J7 gbm provider
>> +PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
>> +PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm = "ti-img-rogue-umlibs-
>> dev"
>>
>>   # This is required when using keystone devices with graphical support
>>   # such as Qt5
>> --
>> 2.22.0
> 


-- 

Regards,
Anand

