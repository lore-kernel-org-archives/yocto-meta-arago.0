Return-Path: <tom.rini@gmail.com>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by arago-project.org (Postfix) with ESMTPS id A673A529BF
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 20:00:19 +0000 (UTC)
Received: by mail-qe0-f41.google.com with SMTP id x7so1339819qeu.28
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2013 12:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=2j3vXAX6+Uwf2dlGomlL1t2wEfYB8UYUbZxA2uHQj2E=;
	b=M6W1mfAL34voGGmgsIoWwhNIqXSlli/Rzn2F9Pr4ZHRYgSxLjTlYQEkSz7lWq4KIi1
	hZ2b38o/7Xyf/wva1eaywvLqFSENktTwSRanERbBdRG4zNn42Qug1IEwXdccsU9lVr/q
	rCPNU9h0qFYlL6E89emeMM2qyGYUUIZM/ANl+Uv+oOYMmtw6SI9Muyf3senP3m/2eOw+
	6ahkbgZcZu74qZuifSUhMmmBV4Qrhv5IGzABk+trl4oZIbzhsfa7jk7hRbZTGccGIB0Z
	8nRAtwrCX32/fpQGlPD/HJIN/RMdsbBZo1H+IBv3hMMi/dB1xVVOCQehx8ZilDUB6dAc
	uNqQ==
X-Received: by 10.224.24.201 with SMTP id w9mr7286078qab.103.1385150418327;
	Fri, 22 Nov 2013 12:00:18 -0800 (PST)
Received: from bill-the-cat (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id jw9sm83923802qeb.2.2013.11.22.12.00.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Nov 2013 12:00:17 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Fri, 22 Nov 2013 15:00:29 -0500
From: Tom Rini <trini@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131122200029.GT420@bill-the-cat>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
	<1385135121-14345-5-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385135121-14345-5-git-send-email-fcooper@ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Fri, 22 Nov 2013 20:00:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 22, 2013 at 09:45:20AM -0600, Franklin S. Cooper Jr wrote:

> * Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a udev entry to
>   automatically mount sd card partition.
> * For some reason that udev entry isn't automatically ran.
> * As a workaround manually trigger udev to run twice (not sure why thats needed)
>   for the udev rule to run correctly.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>

This issn't right.  Have you added debugging steps to the mount.sh script?
We're saying, with this change "lets trigger all block devices 3 times",
and on the 3rd attempt we finally do mount things.  I've seen some
partitions NOT be auto-mounted due to being dirty and needing an fsck
prior to mounting them.  If we need to do this type of change at the end
as a "we can't figure out the root cause, but we need to release", OK.
But I don't think we're there yet.  Thanks!

-- 
Tom

