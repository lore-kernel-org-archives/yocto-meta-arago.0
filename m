Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9DEAC520E5
	for <meta-arago@arago-project.org>;
	Sat, 10 Oct 2020 16:46:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09AGhmYP043777
	for <meta-arago@arago-project.org>; Sat, 10 Oct 2020 11:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602348228;
	bh=Tie/GLA139/Y3CtinSGIXaQuhIKH1YVr/DdZArm80Fo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=B5vR74TZSWmPmZ/Dxf1bBVzJ5ODsR+zrLM+1Igjc5RHMGpdw5OuWp2S4Vn7uGb2SL
	jYIJfroF0J8pqbL3fsQFpAdyRkNLlcQAnrbI2f3sYuzL98vftCR8NwZs1X5LuGb8zT
	kVzMNgcx00R4BJ3RADk4u5LKh/AmzJqolBrUlP8o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09AGhm4W027198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 10 Oct 2020 11:43:48 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 10 Oct 2020 11:43:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sat, 10 Oct 2020 11:43:48 -0500
Received: from [10.250.67.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09AGhmk6130887
	for <meta-arago@arago-project.org>; Sat, 10 Oct 2020 11:43:48 -0500
To: <meta-arago@arago-project.org>
References: <1602200774-36217-1-git-send-email-denis@denix.org>
	<944204e8-f5b4-e6cc-2f3b-d7fac3503861@ti.com>
	<20201009165532.GL23230@beryl>
	<f8e0acd1-6935-72da-32f8-c862c4662a65@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <df2f1b66-5d00-ab6e-f9dd-bca9c435196c@ti.com>
Date: Sat, 10 Oct 2020 11:43:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8e0acd1-6935-72da-32f8-c862c4662a65@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [tisdk-build-scripts][PATCH] distroless/poky: also define TI_SECURE_DEV_PKG variables for HS devices
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
X-List-Received-Date: Sat, 10 Oct 2020 16:46:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/9/20 2:56 PM, Dan Murphy wrote:
> Denys
>
> On 10/9/20 11:55 AM, Denys Dmytriyenko wrote:
>> On Fri, Oct 09, 2020 at 07:04:02AM -0500, Dan Murphy wrote:
>>> Denys
>>>
>>> On 10/8/20 6:46 PM, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@ti.com>
>>> This fails to apply to dunfell-next.
>> It is meant for tisdk-build-scripts per subject prefix.
>
> Thank you this if fine now. I will give it till Monday for comments
>
Applied

Dan


