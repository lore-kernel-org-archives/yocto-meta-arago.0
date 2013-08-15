Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DDF4952A62
	for <meta-arago@arago-project.org>;
	Thu, 15 Aug 2013 19:02:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7FJ24jS029330;
	Thu, 15 Aug 2013 14:02:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7FJ24GQ003004;
	Thu, 15 Aug 2013 14:02:04 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 15 Aug 2013 14:02:04 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7FJ24m9011905;
	Thu, 15 Aug 2013 14:02:04 -0500
Date: Thu, 15 Aug 2013 15:02:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: kiran bobbu <kiran.bobbu@gmail.com>
Message-ID: <20130815190203.GD2190@edge>
References: <CAO7jpqfv_WvnpmEcbH5rZQ3qOGp2SW1Vq4=z=xpHVZuBDBhg=w@mail.gmail.com>
	<CAO7jpqc3W5yVopHS6AFaB3qVq=JsLXoecQryuhKDXkGutExHQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO7jpqc3W5yVopHS6AFaB3qVq=JsLXoecQryuhKDXkGutExHQg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: whats the bitbake target to build X11 for omap5 evm
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
X-List-Received-Date: Thu, 15 Aug 2013 19:02:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 12, 2013 at 10:51:47PM +0530, kiran bobbu wrote:
> hi,
> 
> I am unable to find libpvrPVR2D_DRIWSEGL.so for OMAP5 evm  .
> i found them only for OMAP4 .
> Can someone point to right place to get these for OMAP5?

The SGX driver for OMAP5 is not there yet.

-- 
Denys

