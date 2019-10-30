Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AC1F8529E8
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 14:51:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UEnoYo019974
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 09:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572446990;
	bh=YLgvBfkDswLAJTBStNyVtTERUQtZBs/sFQeZbfqL7WU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=hGbcjNj6hjy9pu3vX5OP3EIAIseTJisE4gsSPf5g1dw2ckerPXCM4yQ6SIFC3SCMl
	kO8cdfA3v/lMG8MWODP91eJVtinlrGPgrRQuAap+QxrmAGv3LFoU480YSB3I4X4mcP
	MalFHatE01sKMjsBgdgrIRvCnf7RvabuRkgw0/zA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UEnouo110521
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 09:49:50 -0500
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 09:49:35 -0500
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
References: <20191029135521.42434-1-e-ruei1@ti.com>
	<20191029211102.GH7518@beryl>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <07fbb684-289e-3dad-ab9b-8a260d4a1511@ti.com>
Date: Wed, 30 Oct 2019 10:49:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029211102.GH7518@beryl>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] libepoxy: specify x11 as false explicitly when config option x11 not used
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
X-List-Received-Date: Wed, 30 Oct 2019 14:51:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/2019 5:11 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 29, 2019 at 09:55:21AM -0400, Eric Ruei wrote:
>> This is required because the default value of x11 is true if not specified.
>>
>> Upstream Status: Accepted
> 
> Wrong use of Upstream-Status. What you want to say is that this change is
> already in upstream master/zeus and is only needed temporarily in thud.
> 
> 
Denys:

What you mean is that I should not use Upstream-Status here and I should 
just add "this change is already in upstream master/zeus and is only 
needed temporarily in thud" in the description, right?

Eric


>> glneo authored and rpurdie committed Sep 13, 2019
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   .../recipes-graphics/libepoxy/libepoxy_%.bbappend              | 3 +++
>>   1 file changed, 3 insertions(+)
>>   create mode 100755 meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
>> new file mode 100755
>> index 00000000..15c373cd
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR_append = ".arago0"
>> +
>> +PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


