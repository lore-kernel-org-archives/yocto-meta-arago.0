Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4D631529AB
	for <meta-arago@arago-project.org>;
	Wed, 14 Feb 2018 14:46:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1EEkQl7005817;
	Wed, 14 Feb 2018 08:46:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518619586;
	bh=xqNLjlXKTRxyRpnoheUKFsz8mPclrsmtYFegkEF3e18=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z8g/oN3WHa76g6wg+cA2hW8DSLIwJ1ClWoJ4bpmVE6eczSWR2kgwHXSXfQe/xIyu+
	7P61IOq9q9lHvV8dglQ7mKTxTAHAG6FYfDiiPQPCusNtAkb9MuukL2jm/WIpUG18sn
	8ml52MifyDrY3y6tWReK5ioYp/MDNT/ZXXElZDaE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1EEkQoA001286;
	Wed, 14 Feb 2018 08:46:26 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 14 Feb 2018 08:46:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 14 Feb 2018 08:46:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1EEkPl9009375;
	Wed, 14 Feb 2018 08:46:26 -0600
Date: Wed, 14 Feb 2018 09:46:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20180214144625.GL31854@edge>
References: <CAFeBWL525C75dwezNganhmoQ2gTRQ-ppbUcxT3r5MJCBwHWVQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL525C75dwezNganhmoQ2gTRQ-ppbUcxT3r5MJCBwHWVQQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: Gforge dicommissioned
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
X-List-Received-Date: Wed, 14 Feb 2018 14:46:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 14, 2018 at 02:45:27PM +0000, Adam Lee wrote:
> It looks like gforge.ti.com has been decommissioned.
> I am getting fetch failures and there are no working mirrors.

Yes, we know.

-- 
Denys

