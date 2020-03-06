Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A5458529A8
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 14:55:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 026ErmI9031490
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 08:53:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583506428;
	bh=gXyXXlnD4cqdMFndmrPEUuNQ0SH/ytkqryaivgJtJnY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=OeRVAAjcM1ZoN2wYRrwVgTf1y+awLdCsSr3vijPFfv86G2yYnN8PlfIl+vAkNClsc
	LO2dIeV1Eg+tWnxPJro9/n2JQY+1XFQvxYjXuNACICgaVZvFqDKFH+qm8EP5UzSmrB
	q+CzY0DQnB9G6lxT0tBcJxUH49m0AMhxfLPJnrzc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 026Ermri077356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 08:53:48 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Mar 2020 08:53:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Mar 2020 08:53:48 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 026Erms2130549;
	Fri, 6 Mar 2020 08:53:48 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1583358315-5293-1-git-send-email-j-stiffler@ti.com>
	<20200305212452.GK1628@beryl>
	<2a366adf-a32e-a1a2-3d8d-0a206b0f339e@ti.com>
	<20200306001514.GQ1628@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c424aa53-30c1-4f00-f648-e511bbacdc68@ti.com>
Date: Fri, 6 Mar 2020 09:53:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200306001514.GQ1628@beryl>
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
X-List-Received-Date: Fri, 06 Mar 2020 14:55:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/5/2020 7:15 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 05, 2020 at 04:49:05PM -0500, Jacob Stiffler wrote:
>> On 3/5/2020 4:24 PM, Denys Dmytriyenko wrote:
>>> Jake,
>>>
>>> Somehow this update has a really hard time getting built - it failed in the
>>> same place with what looks like an our-of-memory error:
>>>
>>> | src_generated/open62541/namespace0_generated.c: In function ‘namespace0_generated’:
>>> | src_generated/open62541/namespace0_generated.c:113178:15: note: variable tracking size limit exceeded with ‘-fvar-tracking-assignments’, retrying without
>>> | 113178 | UA_StatusCode namespace0_generated(UA_Server *server) {
>>> |        |               ^
>>> | arm-none-linux-gnueabihf-gcc: fatal error: Killed signal terminated program lto1
>>> | compilation terminated.
>>> | lto-wrapper: fatal error: /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-gcc returned 1 exit status
>>> | compilation terminated.
>>> | /opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld: error: lto-wrapper failed
>>>
>>> It was not specific to any platform or a build node - all platforms on all
>>> build nodes have failed. I had to revert the update for now, as I needed to
>>> release rc3 very quickly.
>>>
>>> Has this been tested? Any comments?
>> I have built this for both am57xx-evm and am65xx-evm and nativesdk. I have
>> also run-time tested this on x86 and am65x IDK.
>>
>> I did not ice that it took a significantly longer time to build with this
>> update and noticed "lto1-ltrans" as the top hog of resources. I have only
>> noticed this within OE. I do not notice any performance difference in the
>> standalone build.
>>
>> I suspect this may be a result of enabling UA_NAMESPACE_ZERO=FULL, but I do
>> not know why this is isolated to OE.
> Thanks. Is it possible to disable UA_NAMESPACE_ZERO=FULL to see if it improves
> the build resource demands? Is it one of the required features to be enabled?

This is something we want because it is required to make use of other 
standard model namespaces, such as OpcUaDi (device integration) and 
others. I can move this to the PACKAGECONFIG so it is more easily 
configured, but eventually we will need to determine how to make this 
work in our builds.


- Jake


