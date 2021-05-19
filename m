Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id A032752BDF
	for <meta-arago@arago-project.org>;
	Wed, 19 May 2021 23:20:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14JNKeWB033700;
	Wed, 19 May 2021 18:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621466440;
	bh=pXEGmAtG13cKa6k9B2tXI/6B3KCP4/knzuj9P4IjZQM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=L59iSODbFIgmj6D9UkTOIo9dSprwX5ap9sg0OYZuK5I2hMfs+FBSVOf1nuRQI/3P2
	Hco7cveBqY0eHNod/Pfd6zewAkJvA900VPsSIMbw+Uaytz9eNZSinab1rnoJ2YbFCb
	6wIHBYIdg1dgBjoOAFoKzSfHbdgHun1hQH1iU4KM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14JNKeEg123265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 May 2021 18:20:40 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 19 May 2021 18:20:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 19 May 2021 18:20:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14JNKd9I083911;
	Wed, 19 May 2021 18:20:39 -0500
Date: Wed, 19 May 2021 18:20:39 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210519232039.i3g2otxheuza3v7q@facsimile>
References: <20210519124642.21701-1-roopangkumar.patel@ti.com>
	<20210519223929.n3oidsaag5wikia6@chamber>
	<20210519230643.GY1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210519230643.GY1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, prashanth.amai@ti.com,
	sidraya.bj@pathpartnertech.com, praveen.ap@pathpartnertech.com,
	roopangkumar.patel@ti.com
Subject: Re: [PATCH] v4l2 H264 encoder plugin changes
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
X-List-Received-Date: Wed, 19 May 2021 23:20:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:06-20210519, Denys Dmytriyenko wrote:
[...]

> > > +  }
> > 
> > If this is a kernel patch, please don't post it in public kernel list
> > with ti.com ID - this is wrong in so many kernel coding style ways.
> 
> I believe this patch is for gstreamer-plugins-good:
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/blob/master/sys/v4l2/gstv4l2h264enc.c
> 
> Still, not directly applicable to meta-araqgo...


Thanks Denys.
https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests
seems to be the path.

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/commits/master/sys/v4l2/gstv4l2h264enc.c
should give an idea of what the subject line, commit message style and
code style should be.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

