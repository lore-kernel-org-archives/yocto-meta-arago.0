Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 65FC6520E5
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2020 12:07:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 099C43MY119251;
	Fri, 9 Oct 2020 07:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602245043;
	bh=uYVRxwdUXgbUTg+hzxxqrbY3UeSYU/JSuStJOH+aTXo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=gdAbFBxS8jCFla23AK4piz5pa4nNi2iXg6aEhItzUHxgnEs0EnfoF1qJwwbtFkHCY
	m11ZMMvgvhGWnLZnZbB2VX5c+uf8rtgcVKeI4iaXON7ANPJiYqiiGbtG+OTQVUDaMH
	cNay5atf20e933BNmoCAUPOZJtMIa4tQ3Zi1mMiQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 099C43hZ091103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2020 07:04:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 9 Oct 2020 07:04:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 9 Oct 2020 07:04:03 -0500
Received: from [10.250.67.147] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 099C43X7079233;
	Fri, 9 Oct 2020 07:04:03 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1602200774-36217-1-git-send-email-denis@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <944204e8-f5b4-e6cc-2f3b-d7fac3503861@ti.com>
Date: Fri, 9 Oct 2020 07:04:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602200774-36217-1-git-send-email-denis@denix.org>
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
X-List-Received-Date: Fri, 09 Oct 2020 12:07:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/8/20 6:46 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>

This fails to apply to dunfell-next.

Dan



