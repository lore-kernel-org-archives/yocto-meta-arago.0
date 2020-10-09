Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id CFDF452982
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2020 19:59:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 099JuLhG117919;
	Fri, 9 Oct 2020 14:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602273381;
	bh=wLYR+e5LLEvOuRNNPAfu2zJcjgb12iKbB+8HJeI1jaw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ZAhCnXxb+y5jZmpy9DvRRlFQskYYaGKcr2JmsUx7xOU+cX+x+3gLXclS9nZUWb9BM
	pLtoYNGjMLjKVdYx0ZMCklHDaIAnnbc/jD5SFmhV/3jL0Mv4g1IlxobF5uFc83NmZo
	M/sMV8357FzJfloC/AJzBuavJOp8jkdGXDH/UvmI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 099JuLF2065178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2020 14:56:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 9 Oct 2020 14:56:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 9 Oct 2020 14:56:21 -0500
Received: from [10.250.67.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 099JuLOR102209;
	Fri, 9 Oct 2020 14:56:21 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1602200774-36217-1-git-send-email-denis@denix.org>
	<944204e8-f5b4-e6cc-2f3b-d7fac3503861@ti.com>
	<20201009165532.GL23230@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <f8e0acd1-6935-72da-32f8-c862c4662a65@ti.com>
Date: Fri, 9 Oct 2020 14:56:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009165532.GL23230@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Fri, 09 Oct 2020 19:59:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/9/20 11:55 AM, Denys Dmytriyenko wrote:
> On Fri, Oct 09, 2020 at 07:04:02AM -0500, Dan Murphy wrote:
>> Denys
>>
>> On 10/8/20 6:46 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>> This fails to apply to dunfell-next.
> It is meant for tisdk-build-scripts per subject prefix.

Thank you this if fine now. I will give it till Monday for comments

Dan



