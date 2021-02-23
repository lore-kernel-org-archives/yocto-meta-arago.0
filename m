Return-Path: <lokeshvutla@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 547F652975
	for <meta-arago@arago-project.org>;
	Tue, 23 Feb 2021 15:39:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11NFdLWI122042
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2021 09:39:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614094761;
	bh=jYY2TvZMrF97gupzhctOYi2ZvW4umXaYqNYNCYvypTQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Fm9e7v2DTwrXkGIayAgJj/QJDEGfabkcs7NiOD/yT6UVATs1g8ESoO9LT7zsdg1b0
	8vF7ojgQNkVef6gy1HAtX4adK9pWTLGQNK7a3BW/9YlTElXzBtvdsECl3GGkut78pV
	R3BkqkVHKqclepQrKZjvC8nhI5f9kklLPRqtPTR0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11NFdL9m070812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2021 09:39:21 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 23 Feb 2021 09:39:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 23 Feb 2021 09:39:21 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11NFdJbZ089144;
	Tue, 23 Feb 2021 09:39:20 -0600
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>,
	<praneeth@ti.com>
References: <20210223150412.5124-1-nikhil.nd@ti.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <14633cdf-dc04-5132-0f1d-49c25b50f614@ti.com>
Date: Tue, 23 Feb 2021 21:09:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223150412.5124-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsekhar@ti.com, kishon@ti.com
Subject: Re: [dunfell PATCH] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Tue, 23 Feb 2021 15:39:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23/02/21 8:34 pm, Nikhil Devshatwar wrote:
> Currently, the K3 platforms do not include the TI wlan related packages.
> Add in the tisdk-connectivity packagegroup.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

It is always good to give Suggested-by credits.

Suggested-by: Hari Nagalla <hnagalla@gmail.com>

Also this is a v2 of your previous patch[0]. This should be specified in
$subject tag and add change log in notes section. Otherwise,

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

[0] http://patchwork.dal.design.ti.com/patch/59321/

Thanks and regards,
Lokesh

