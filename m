Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D6453529B8
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 15:47:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51FlGPK015182;
	Mon, 1 Jun 2015 10:47:16 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51FlGvR030233;
	Mon, 1 Jun 2015 10:47:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 10:47:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51FlFQA006164;
	Mon, 1 Jun 2015 10:47:15 -0500
Date: Mon, 1 Jun 2015 11:47:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150601154714.GO16418@edge>
References: <CADnUhn3e549puHVotRyCb4aH7z8uE4vy-waRvocpVygaZ7C27Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn3e549puHVotRyCb4aH7z8uE4vy-waRvocpVygaZ7C27Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: what config should I choose?
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
X-List-Received-Date: Mon, 01 Jun 2015 15:47:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 29, 2015 at 08:44:18AM +0300, matti kaasinen wrote:
> Hi!
> 
> I plan to switch from Silicas ArhiTech distro (Pengwyn based board - am335x
> with nand flash) because ArchiTech has frozen (around 2013) with all the
> bugs and having nearly zero user activity.
> 
> Could you please comment how mature your Fido layer is. Is it already
> "stable" or would I aim at running target with it? Should I choose Daisy
> instead?

If you only need meta-ti BSP layer, then you can use either Daisy or Fido.
If you also need meta-arago Distro layer, then Fido is not yet ready and Daisy 
is the one you want.

-- 
Denys

