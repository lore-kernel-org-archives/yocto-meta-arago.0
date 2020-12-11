Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 02939529D4
	for <meta-arago@arago-project.org>;
	Fri, 11 Dec 2020 13:39:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDdjvr062400
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 07:39:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693985;
	bh=hzc/eO9KDoYn6M1HBXWA6MbXtXM6OQ11nk9esN/Ql0U=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=A6DgTTQrkl+r3E1HdA7SzpsCElD88rVyEAkhJ0o8YPtN9QjMbXWNC581kFWGtSXM7
	xfy5Fr9sz16dfxYRzo2KdPP6wl9xgPWc8pxok1kw0475DdPyjnCNdopeiIGwpHEelN
	IWWThA2vQGTY96mPaNZ9bbt/rhU/NWFaCa44CJK0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDdjO5121885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 11 Dec 2020 07:39:45 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 11 Dec 2020 07:39:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 11 Dec 2020 07:39:45 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDdjZj019796;
	Fri, 11 Dec 2020 07:39:45 -0600
To: Caleb Robey <c-robey@ti.com>, <meta-arago@arago-project.org>
References: <20201209191713.22358-1-c-robey@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1a8d3517-2b07-35c3-a7c4-85b7e99454eb@ti.com>
Date: Fri, 11 Dec 2020 07:39:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209191713.22358-1-c-robey@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: a0232989 <a0232989@ti.com>, a0132237 <a0132237@ti.com>
Subject: Re: [PATCH 1/2] [meta-ti][dunfell/master][PATCH] setup-scripts - removing confusion for users when script succeeds, but does not include correct version in success message
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
X-List-Received-Date: Fri, 11 Dec 2020 13:39:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Caleb

On 12/9/20 1:17 PM, Caleb Robey wrote:
> From: a0232989 <a0232989@ti.com>

Please use your real name here

And you did not add the Signed-off-by

Also please fix the $subject

Dan


