Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2F7DA52995
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 21:51:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025Ln53V116658
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 15:49:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583444945;
	bh=hO9E8+SbsDKBcLZsGdpryFovOWGvUL8Krna2H9V4990=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=GlyCtR0jZ2I3O0CLGLLRI9whAt9KWjGwtO0fofuUZIs6I7BhlYdUMSFA9d3foqFoR
	/D+JU/vWY/gN2dF7jpzls+7oEwCK3bNEPh4XoDiC6oQWJ/p/CifTkyDivgo9n3u45X
	zBmHfATYdnrUA9I3F8/sDnzSON8r7pm2wdKEDhVE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025Ln5oZ083148
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 15:49:05 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 15:49:05 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 15:49:05 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 025Ln4pZ045273; 
	Thu, 5 Mar 2020 15:49:05 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1583358315-5293-1-git-send-email-j-stiffler@ti.com>
	<20200305212452.GK1628@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2a366adf-a32e-a1a2-3d8d-0a206b0f339e@ti.com>
Date: Thu, 5 Mar 2020 16:49:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200305212452.GK1628@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] open62541: upgrade to version 1.0.1, other fixes
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
X-List-Received-Date: Thu, 05 Mar 2020 21:51:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/5/2020 4:24 PM, Denys Dmytriyenko wrote:
> Jake,
>
> Somehow this update has a really hard time getting built - it failed in the
> same place with what looks like an our-of-memory error:
>
> | src_generated/open62541/namespace0_generated.c: In function ‘namespace0_generated’:
> | src_generated/open62541/namespace0_generated.c:113178:15: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
> | 113178 | UA_StatusCode namespace0_generated(UA_Server *server) {
> |        |               ^
> | arm-none-linux-gnueabihf-gcc: fatal error: Killed signal terminated program lto1
> | compilation terminated.
> | lto-wrapper: fatal error: /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-gcc returned 1 exit status
> | compilation terminated.
> | /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: error: lto-wrapper failed
>
> It was not specific to any platform or a build node - all platforms on all
> build nodes have failed. I had to revert the update for now, as I needed to
> release rc3 very quickly.
>
> Has this been tested? Any comments?

I have built this for both am57xx-evm and am65xx-evm and nativesdk. I 
have also run-time tested this on x86 and am65x IDK.

I did not ice that it took a significantly longer time to build with 
this update and noticed "lto1-ltrans" as the top hog of resources. I 
have only noticed this within OE. I do not notice any performance 
difference in the standalone build.

I suspect this may be a result of enabling UA_NAMESPACE_ZERO=FULL, but I 
do not know why this is isolated to OE.


- Jake



