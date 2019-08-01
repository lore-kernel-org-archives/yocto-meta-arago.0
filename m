Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 13F0452998
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2019 15:46:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71FjsBb029434
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 10:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564674355;
	bh=Jf3eXITxyNASy96ggvdhHonkJGtf1+FqpjP2SkPdlVg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CRGC2xs7DvniHrkP6sbIrrG8pyfL4ama93HbiMBHWZlXOJLIengSFDGMvQ48zwiB8
	tBymUfRNBKpPEZmeL7d4IyT0BfysA+igIONbMcBs6kQhGdT6AVkJ1UA6hh3Q/74OzA
	3Tsl4bDH2psDhQXXp6O8VEbGzYja+F89XD+Vst8U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71Fjs41049382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 10:45:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 1 Aug 2019 10:45:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 1 Aug 2019 10:45:54 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71FjseI007881;
	Thu, 1 Aug 2019 10:45:54 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1564665868-14785-1-git-send-email-j-stiffler@ti.com>
	<20190801154014.GD20944@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <fc1a29eb-c333-0ddf-cc12-06cf3b537695@ti.com>
Date: Thu, 1 Aug 2019 11:45:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801154014.GD20944@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH] packagegroup-arago-base: add avahi-utils along with zeroconf
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
X-List-Received-Date: Thu, 01 Aug 2019 15:46:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/1/2019 11:40 AM, Denys Dmytriyenko wrote:
> Not sure adding to the base is a good idea here...


Makes sense. Do you have any suggestions? Maybe console, connectivity, 
or addons?


>
> On Thu, Aug 01, 2019 at 09:24:28AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> index 4094d90..cc601b0 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
>> @@ -31,7 +31,7 @@ ARAGO_EXTRA = "\
>>   
>>   # minimal set of packages - needed to boot
>>   RDEPENDS_${PN} = "\
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf avahi-utils', '',d)} \
>>       ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
>>       ${ARAGO_BASE} \
>>       ${ARAGO_EXTRA} \
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

