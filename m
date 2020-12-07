Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id EAB3B529B7
	for <meta-arago@arago-project.org>;
	Mon,  7 Dec 2020 18:51:28 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7Fv2Vs026430;
	Mon, 7 Dec 2020 09:57:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607356622;
	bh=xkXCnC/T7BrAnkr95ngBuNR/ic0BxBvro6kxIu84dY8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Ny4LaiFLgnNDM1y66cDVoMkhEQZhiM070kcxUpuvlhLBCu0bl/HUNATCFgjBHOh0Q
	nkt1yr4NZECNe2LzE00PNCTqnGaQvS3Nr/514Ew2XlWdqrwJd0T42SNQZn1rjU2pOs
	TNijx8ag728AayhJq9gR9QHhHRUbkMWAZbKs8vzQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7Fv2BK074332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Dec 2020 09:57:02 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 7 Dec 2020 09:57:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 7 Dec 2020 09:57:01 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7Fv16l117825;
	Mon, 7 Dec 2020 09:57:01 -0600
To: Paul Barker <pbarker@konsulko.com>
References: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
	<94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
	<CAM9ZRVuurWq0BMbNbYbwq5r5JedNu1680LzjKQJ5C=6M40uCNw@mail.gmail.com>
	<CAM9ZRVvpNM6H1Am+wHnmzKM-QJFJrJi0KrDezf+mDfjJNFo8Sw@mail.gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <3d250b4e-f958-bdc8-1f27-6f305b8882c7@ti.com>
Date: Mon, 7 Dec 2020 09:57:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVvpNM6H1Am+wHnmzKM-QJFJrJi0KrDezf+mDfjJNFo8Sw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] How to tell when meta-ti/meta-arago or TI CoreSDK is released
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
X-List-Received-Date: Mon, 07 Dec 2020 18:51:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Paul

On 12/7/20 7:22 AM, Paul Barker wrote:
> On Tue, 24 Nov 2020 at 18:27, Paul Barker <pbarker@konsulko.com> wrote:
>> On Tue, 17 Nov 2020 at 19:42, Dan Murphy <dmurphy@ti.com> wrote:
>>> Paul
>>>
>>> On 11/17/20 1:17 PM, Paul Barker wrote:
>>>
>>> Hey folks, apologies if this isn't the right place to ask but I can't
>>> see where else I should be asking this question.
>>>
>>> The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
>>> meta-ti. For our Arago builds I typically pin release versions of
>>> these dependency layers, especially for meta-arago and meta-ti I want
>>> to ensure that we're using known good versions. The tag we're
>>> currently pinned to is 07.00.00.005 which I believe corresponds to a
>>> TI CoreSDK release. I see there are some new tags in these layers and
>>> in the ti-linux-kernel repository
>>>
>>> I also see that configs have been added to the oe-layersetup
>>> repository which is usually my flag that something has been released.
>>> However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
>>> given config files while the meta-arago layer, meta-ti layer and
>>> ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
>>> are a bit confused.
>>>
>>> I've tried searching for "ti coresdk" in google but I can't find any
>>> documentation for this. I've also tried looking at the Arago wiki but
>>> this does not look to have been updated recently. The only list of
>>> branches I can find is
>>> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>>> which is definitely obsolete.
>>>
>>> So all I can do is ask the question then - how do I find out when a
>>> release of Arago (or TI CoreSDK) is ready to pick up and use?
>>>
>>> This is on my to do for next year to try to document expected release dates.
>>>
>>> To pre-empt the obvious question - we do test with the HEAD of the
>>> dunfell branch of layers regularly but we're not happy to issue a
>>> release of our own BSP without ensuring we're aligned on released
>>> versions of the underlying layers where possible. We need to track the
>>> releases in the ti-linux-kernel layer as we've seen in the past that
>>> our kernel needs to match with the expectations of the meta-ti layer
>>> if we want the PowerVR drivers to work.
>>>
>>> Sorry for all the confusion. I created those additional configs for our internal SDK consumers.
>>>
>>> The official release will be 07.01.00.006 and I will be pushing that config shortly.
>> Hi Dan,
>>
>> I see that there is now a config file in the oe-layersetup repository
>> for v07.01.00.006.
>>
>> Is there any way I can tell if there will be a further pre-release
>> here (e.g. 07.01.00.007) or if this is the "final" 07.01.00 release
>> and ready for downstream users to pick up?
>>
>> Some reference for how CoreSDK is released would be really helpful but
>> I can't find any such info online - I don't really need expected
>> release dates, I just need to know how I can determine if something is
>> "released" or not.
> Hi Dan, just a quick ping on this. I'd like to get our BSP updated for
> AGL and Arago support but I'm waiting on confirmation that
> meta-ti/meta-arago are released. A link to some process documentation
> or even just a "yes this is released" or "no, there will be an
> 07.01.00.007 tag coming" would be great.

Sorry for the delay I was triaging an upstream failure.

The 07.01.00.006 is an official release. No 07.01.00.007 tag

Dan
> Thanks,
>

