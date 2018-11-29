Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EAAE5529C8
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2018 18:47:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wATIlcr2079404
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 12:47:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543517259;
	bh=K1eMH9JpNCS4miGhFmba2uO9ystdDgWSuT2lt/5OKWM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=udaguvuIuGQzC7bXNR8JfsRBB993oVf7qROMIqVJslubMgQcgOtnzAAl5KN5Q7lcq
	sas61+Gw4LmAPKTBm4zJY64YmdfOvBQAAU+3/LbhuLMC7HZdMMi2KvyXfkIvu02rEj
	+6Wp/SuWKYwFUTOQqiCYrRPx7UPRUZOUakS//CQg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wATIlc44016596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 12:47:38 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 29 Nov 2018 12:47:38 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 29 Nov 2018 12:47:38 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wATIlbZd028240;
	Thu, 29 Nov 2018 12:47:37 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1543430318-24222-1-git-send-email-j-stiffler@ti.com>
	<20181129181846.GO29204@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0a869a25-4b23-487e-0b0d-f434692e8d3b@ti.com>
Date: Thu, 29 Nov 2018 13:47:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181129181846.GO29204@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] processor-sdk-rocko-config: add meta-virtualization
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
X-List-Received-Date: Thu, 29 Nov 2018 18:47:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/29/2018 1:18 PM, Denys Dmytriyenko wrote:
> Any plans for upstreaming this?


Yes, but I missed the merge window. I will first need to work to 
upstream the necessary kernel config.


> On Wed, Nov 28, 2018 at 01:38:38PM -0500, Jacob Stiffler wrote:
>> * And add dependent meta-filesystems from meta-openembedded.
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   configs/processor-sdk/processor-sdk-rocko-config.txt | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/configs/processor-sdk/processor-sdk-rocko-config.txt b/configs/processor-sdk/processor-sdk-rocko-config.txt
>> index c8b4427..6ea9a41 100644
>> --- a/configs/processor-sdk/processor-sdk-rocko-config.txt
>> +++ b/configs/processor-sdk/processor-sdk-rocko-config.txt
>> @@ -7,7 +7,8 @@ meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a
>>   meta-arago,http://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
>>   meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
>>   meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
>> -meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
>> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,HEAD,layers=
>> +meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
>>   meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
>>   meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
>>   oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

