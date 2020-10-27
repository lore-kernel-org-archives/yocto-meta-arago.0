Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 94C2752999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 19:00:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RIvCMN061112
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 13:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603825032;
	bh=G73XbUgsJUeYd20oPRCYNxuNoZ3qfawMp9wMao0kR2s=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=GSa6sf7FxuWyoirrCn0svHm3w4waJ2siy44WYjxBJsR8fFqTH+yqkrlxll8Dzg9Pm
	up76pL6Fi1HQ+xo72RThEjDcMQy1JdUAb1NN7Gr25+DL4Lu4g1jKoveLNXYyyUZd2A
	BOCjUzsvEsKpogS0oFatZs1lqzRFUwJVGcJ1Cftw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RIvCN8095585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 13:57:12 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 27 Oct 2020 13:57:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 27 Oct 2020 13:57:11 -0500
Received: from [10.250.36.55] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RIvBiR121864;
	Tue, 27 Oct 2020 13:57:11 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20201026155125.31513-1-nikhil.nd@ti.com>
	<1cfdbbf2-80e3-29b6-02f0-c6ef9b332168@ti.com>
	<20201027101128.p2ub37j5ycztmzm6@NiksLab>
	<5c43aa61-ee89-ac25-d7f5-42ad3f3a8668@ti.com>
	<20201027185207.GV19741@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1536bc19-4519-eb0a-0db1-0d9f3db9074b@ti.com>
Date: Tue, 27 Oct 2020 13:57:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027185207.GV19741@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, aparnab@ti.com
Subject: Re: [dunfell PATCH 1/2] websocketd: Add new recipe
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
X-List-Received-Date: Tue, 27 Oct 2020 19:00:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/27/20 1:52 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 27, 2020 at 01:42:32PM -0500, Dan Murphy wrote:
>> Nikhil
>>
>> On 10/27/20 5:11 AM, Nikhil Devshatwar wrote:
>>> On 11:09-20201026, Dan Murphy wrote:
>>>> Nikhil
>>>>
>>>> On 10/26/20 10:51 AM, Nikhil Devshatwar wrote:
>>>>> websocketd is an application which allows to redirect output of
>>>>> command line applications via a websocket so that web pages can
>>>>> interact with them.
>>>>>
>>>>> This is very useful for visualizing statistics information on
>>>>> host machine browser.
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> ---
>>>>>    .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
>>>>>    1 file changed, 16 insertions(+)
>>>>>    create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>>>>>
>>>>> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>>>>> new file mode 100644
>>>>> index 00000000..44f549ee
>>>>> --- /dev/null
>>>>> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
>>>>> @@ -0,0 +1,16 @@
>>>>> +SUMMARY = "Application for routing native applications via websockets"
>>>>> +HOMEPAGE = "http://websocketd.com/"
>>>>> +
>>>>> +LICENSE = "BSD-2-Clause"
>>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
>>>>> +
>>>>> +PV = "0.3.0"
>>>> 0.3.1 is available
>>>>> +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
>>>> Is this valid for ARM32? Does this build for am3 or am4?
>>>>
>>>> I see websocketd-0.3.1-linux_arm.zip available for 32 bit
>>> This is planned to be supported only for K3 platforms.
>>> I haven't run it on any arm32 platforms.
>>> Should I add a compatible machine here and in the statcol recipe as well?
>> If you only intend to use the 64 bit package then yes you probably should
>> restrict it to 64 bit platforms so it does not get pulled into the 32 bit
>> platform.
> Why cannot it be build from sources instead of pulling prebuilt binaries?
>
It is coded in Go can the Yocto build Go yet?

Dan


