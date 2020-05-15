Return-Path: <prao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C723252A44
	for <meta-arago@arago-project.org>;
	Fri, 15 May 2020 20:04:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FK1heq130356
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 15:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589572903;
	bh=SaMMVarCPJ/qHl2mRlSWqQ2QdzWy8ZLk+d10t0gAGrs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qCq44XUvpH7n/wPkWnUJi979OIbNemf65MpBPogAb2tIiYv7utpzYsa6rWvCIRmcB
	8jyxWVnmXMWt7K3mWCNzdac6Uh0c/8wANFpzL/9MJ29CyjlhiuC1NXFT1iSylYkyBy
	cC6lrE3XA55IQeiwb7P/vQi8bodxJVx90MBszxNA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FK1hk3045777
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 15:01:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 15 May 2020 15:01:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 15 May 2020 15:01:43 -0500
Received: from [10.250.226.221] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FK1g9a067760;
	Fri, 15 May 2020 15:01:43 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, Denys Dmytriyenko <denys@ti.com>
References: <20200515184439.3339-1-prao@ti.com> <20200515184605.GG8594@beryl>
	<d15f1b3d-04c0-427f-8525-d733886a78ca@ti.com>
From: Praveen Rao <prao@ti.com>
Message-ID: <115324fd-c679-7c91-b631-5fea3d877521@ti.com>
Date: Fri, 15 May 2020 15:01:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d15f1b3d-04c0-427f-8525-d733886a78ca@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH] packagegroup: Add ti-sci-fw-src to tisdk-addons-sdk-host
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
X-List-Received-Date: Fri, 15 May 2020 20:04:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Pls ignore this patch. Encountered build error with it.


On 5/15/20 2:09 PM, Nikhil Devshatwar wrote:
> Hi Denys,
> 
> On 16/05/20 12:16 am, Denys Dmytriyenko wrote:
>> Have you even tried it yourself?
>>
> Praveen has been debugging some issue where the source package for 
> ti-sci-fw is not included in the installer.
> I asked him to check in the packagegroup-arago-tisdk-addons-sdk-host.bb 
> and he found it was missing
> 
> Is this dropped for some reason?
> Also, now shall we rename SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 to 
> board-support/k3-image-gen-${PV} ?
> 
> Regards,
> Nikhil D
>> On Sat, May 16, 2020 at 12:14:39AM +0530,prao@ti.com  wrote:
>>> From: Praveen Rao<prao@ti.com>
>>>
>>> Add source package for k3 image gen in the tisdk-addons-sdk-host
>>>
>>> Signed-off-by: Praveen Rao<prao@ti.com>
>>> ---
>>>   .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>>> index 6dcb253c..32d6c98b 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>>> @@ -38,6 +38,7 @@ UTILS_append_k2g = " \
>>>   
>>>   UTILS_append_k3 = " \
>>>       jailhouse-src \
>>> +    ti-sci-fw-src \
>>>       arm-trusted-firmware-src \
>>>   "
>>>   
>>> -- 
>>> 2.17.1
>>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

