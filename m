Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C60B45299E
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2018 18:06:48 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wATI6cCH002217
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 12:06:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543514798;
	bh=MvU0CsqTIoFbfqDTdYS4f3xnJtQGsP4gCG7RkeVq4Jk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WYyAjQXnZ/SFTh+W1thVL/XJH/7zP4fmQEEyTLXfRGCMFRuwAOViQ1m8jDv+5YDqg
	e4vIX+CYoIIZtV541J0zxAzvl+ZqIXuCexxQOmFd7KcSRC2j2gmqeij4Sik4j9AnU3
	AgWhXWlTBCOTZvet57mUsCCLaN3hhBFBNVyNHmAA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wATI6bPZ109874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 12:06:38 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 29 Nov 2018 12:06:37 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 29 Nov 2018 12:06:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wATI6bt3008261;
	Thu, 29 Nov 2018 12:06:37 -0600
Date: Thu, 29 Nov 2018 13:06:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20181129180636.GN29204@beryl>
References: <1543358655-13618-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1543358655-13618-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] arm-compute-library: bump SRCREV and add TI benchmark test group.
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
X-List-Received-Date: Thu, 29 Nov 2018 18:06:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged into next for testing.

