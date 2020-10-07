Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1C244520E5
	for <meta-arago@arago-project.org>;
	Wed,  7 Oct 2020 16:05:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097G29fF021082
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 11:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602086529;
	bh=vZ9TmK9PKEablinS2gu99V5cFdfO0bwcLrqz/140ZYw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=XZC7zNvpinWGYlQgCcCZUjmJ72spZKh1cJ90O14V9YGDY690I5a/dR3oCBJlsCoj0
	38W92YSgVWntP9mHceJdCa+7T2A6qQAfhF8Sgi6wtUJgJ0lOzyxn8S2UJkSFXBeYcf
	buIowsIyylym+3Oc5T7hrHZigLoCFM/24qz4IgdA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097G29GA004761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 7 Oct 2020 11:02:09 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 7 Oct 2020 11:02:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 7 Oct 2020 11:02:08 -0500
Received: from [10.250.39.105] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097G287R067175;
	Wed, 7 Oct 2020 11:02:08 -0500
To: Denys Dmytriyenko <denys@ti.com>, Aparna Balasubramanian <aparnab@ti.com>
References: <20201007155758.32716-1-aparnab@ti.com>
	<20201007155930.GF23230@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <caaef03a-df12-9bb2-e65b-64d06f1c7971@ti.com>
Date: Wed, 7 Oct 2020 11:02:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007155930.GF23230@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 07 Oct 2020 16:05:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/7/20 10:59 AM, Denys Dmytriyenko wrote:
> Looks good, thanks.
How about a reviewed-by?

