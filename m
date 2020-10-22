Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 82D27529A4
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2020 12:32:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MCTVnK090487;
	Thu, 22 Oct 2020 07:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603369771;
	bh=acSzcU6nSW1/XiOqUjtpwPX74q1e3cYneEGPJxrFc8g=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=X6FDyo8e+DtC9rla317neG6yGETXHkDNJVMYIwpc8s45Fc3nb3UfDtN3VzVPTogwj
	bVOF6qm56OBjWcNQ/Z65diWv0Fq9HS28yOBcsR41f035M/gio9o1HghM0ldiBHvhhj
	VwISlbk7X+1FVC6a1ekJrgbhXADuVkCHeSPDrgbg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MCTV5i089489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Oct 2020 07:29:31 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 22 Oct 2020 07:29:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 22 Oct 2020 07:29:31 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MCTV2A051789;
	Thu, 22 Oct 2020 07:29:31 -0500
From: Dan Murphy <dmurphy@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Paul Barker <pbarker@konsulko.com>
References: <20201019194549.169360-1-pbarker@konsulko.com>
	<20201020005421.GN14852@beryl>
	<8ef5cdc2-2c51-253d-e1da-178adc72ac9f@ti.com>
Message-ID: <397591b2-5878-6357-ef47-8fe387cf86e2@ti.com>
Date: Thu, 22 Oct 2020 07:29:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8ef5cdc2-2c51-253d-e1da-178adc72ac9f@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] packagegroup-arago-sysvinit-boot: Skip recipe if sysvinit is not enabled
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
X-List-Received-Date: Thu, 22 Oct 2020 12:32:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello

On 10/20/20 1:52 PM, Dan Murphy wrote:
> Hello
>
> On 10/19/20 7:54 PM, Denys Dmytriyenko wrote:
>> On Mon, Oct 19, 2020 at 08:45:49PM +0100, Paul Barker wrote:
>>> This change fixes the following error seen at parse time when the
>>> meta-arago-distro layer is present but sysvinit is not in
>>> DISTRO_FEATURES:
>>>
>>>      ERROR: 
>>> .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: 
>>> Please ensure that your setting of VIRTUAL-RUNTIME_init_manager 
>>> (sysvinit) matches the entries enabled in DISTRO_FEATURES
>>>      ERROR: Failed to parse recipe: 
>>> .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>>>
>>> Signed-off-by: Paul Barker <pbarker@konsulko.com>
>> Reviewed-by: Denys Dmytriyenko <denys@ti.com>
>
> Applied to dunfell-next
>
applied to dunfell and master

Dan


