Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5B18452A22
	for <meta-arago@arago-project.org>;
	Thu, 18 Mar 2021 16:26:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12IGRFhi107418;
	Thu, 18 Mar 2021 11:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616084835;
	bh=YLvveUEui48evYlY1AjOS+BdNx818JLbIz8ql+yFe0s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DjpFLy+Tatu6LRSfAXM/mu9Z834pgfRQehh9vjIK9twP6/ORSSc1RuLwBSVugh8pw
	flk+6NJ1KR5UjooWy9A/9JMqRcuqX9Qtr3to6QNdkVZnfnThtT7g5NkNn7zhZDozEc
	pBuGFZRP0UfHxOdK7YgU7l5MD2CyA8m0IELUxEDs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12IGRFSj040741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Mar 2021 11:27:15 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 18 Mar 2021 11:27:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 18 Mar 2021 11:27:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12IGRFcn118729;
	Thu, 18 Mar 2021 11:27:15 -0500
Date: Thu, 18 Mar 2021 11:27:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210318162715.ic7rk7kldf4ivmdq@molehill>
References: <1616084115-43128-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1616084115-43128-1-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH] configs/farm: update local mirror address
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
X-List-Received-Date: Thu, 18 Mar 2021 16:26:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:15-20210318, Denys Dmytriyenko wrote:
> Only update active configs for dunfell and master.
> 

Gee, thanks.

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

