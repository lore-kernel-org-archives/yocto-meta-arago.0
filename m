Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id AA89A52AC9
	for <meta-arago@arago-project.org>;
	Sat,  6 Oct 2012 18:51:13 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2568878oag.38
	for <meta-arago@arago-project.org>;
	Sat, 06 Oct 2012 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xpg0uHYezfcHSctA+aNZtHtOtJN+GXDjBAXJ7jpDtIY=;
	b=KZj93TrC12NhFNBYL2V0pNOGMOtKCOsHaW6biNubxSVn393yrQp4JD3qv2YuW+TyJ4
	DtyvaOfBJXY7IP7B0583SL8qvug1hM7G82wgwdf3bVnZUoxAZIaJeEf/eGpZVN6Y0AlD
	Tx/q8aQQJIICD7Mj5it9sXbnv6g8q/46Jrfzx6j961hA0vhgfJI0Kzo567lLiDiec/+P
	56s2y9H3kImJjtGF7h5pWCEZUvDJorG+8Q1hfzNuQ+88IUK716HNlWJ7zdF/kcQCsNJ/
	H4QWnvvIRKjaRabl2m+aMoknU+mo8XbjPf4L1cdKhMsefsRKK1QqfqecXYOHpQ19HD02
	X1bw==
Received: by 10.60.171.134 with SMTP id au6mr9641702oec.69.1349549472912;
	Sat, 06 Oct 2012 11:51:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a6sm9997962oeh.1.2012.10.06.11.51.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 11:51:12 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat,  6 Oct 2012 14:20:07 -0500
Message-Id: <1349551207-12985-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] iperf: Upgrade to version 2.0.5
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
X-List-Received-Date: Sat, 06 Oct 2012 18:51:14 -0000

* Upgrade to version 2.0.5.
* New version needed since it was observed to have lower CPU utilization
  which resulted in better throughput performance.
* Below patches used in version 2.0.4 are no longer needed:
    004-svn-r43-ro.patch (already applied)
    006-iperf-die-on-connect-fail.patch (already applied)
    009-delayloop.patch (equivalent solution already exists)
* Patch 000-Iperf_Fix-CPU-Usage.diff has been updated to apply to
  version 2.0.5

  Upstream status: Submitted to meta-oe (master)

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Add patches for iperf 2.0.4 from meta-oe.
Removed unneeded patches.
Massaged a patch that orginally didn't apply.

 .../iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff |   45 +++++
 .../001-cast-to-max_size_t-instead-of-int.patch    |   14 ++
 .../003-fix-hyphen-used-as-minus-sign.patch        |  178 ++++++++++++++++++++
 .../iperf-2.0.5/005-iperf-die-on-bind-fail.patch   |   15 ++
 .../iperf-2.0.5/007-iperf-reporter-deadlock.patch  |   68 ++++++++
 .../iperf/iperf-2.0.5/008-numofreport.patch        |   15 ++
 .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   41 +++++
 7 files changed, 376 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_t-instead-of-int.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-as-minus-sign.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind-fail.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-deadlock.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff
new file mode 100644
index 0000000..ff801a4
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff
@@ -0,0 +1,45 @@
+From c7c18bc93441872e7ff2fa47a18a12ef319b7949 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Sat, 6 Oct 2012 12:32:29 -0500
+Subject: [PATCH] iperf: Fix CPU Usage
+
+* Updated the patch 000-Iperf_Fix-CPU-Usage.diff to apply to iperf v2.0.5
+* That patch was largely based on the patch:
+  http://marc.info/?l=linux-kernel&m=119088670113210&w=2
+* The majority of the changes from 000-Iperf_Fix-CPU-Usage.diff have been
+  incorporated into iperf v2.0.5.
+* The two remaining thread_rest changes that 000-Iperf_Fix-CPU-Usage.diff
+  made have been added to this version of iperf v2.0.5
+
+Upstream-Status: Inappropriate [not author]
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ src/Reporter.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Reporter.c b/src/Reporter.c
+index 7d9263b..4fbb712 100644
+--- a/src/Reporter.c
++++ b/src/Reporter.c
+@@ -391,7 +391,7 @@ void EndReport( ReportHeader *agent ) {
+     if ( agent != NULL ) {
+         int index = agent->reporterindex;
+         while ( index != -1 ) {
+-            thread_rest();
++            Condition_Wait( &ReportDoneCond );
+             index = agent->reporterindex;
+         }
+         agent->agentindex = -1;
+@@ -412,7 +412,7 @@ void EndReport( ReportHeader *agent ) {
+ Transfer_Info *GetReport( ReportHeader *agent ) {
+     int index = agent->reporterindex;
+     while ( index != -1 ) {
+-        thread_rest();
++        Condition_Wait( &ReportDoneCond );
+         index = agent->reporterindex;
+     }
+     return &agent->report.info;
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_t-instead-of-int.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_t-instead-of-int.patch
new file mode 100644
index 0000000..b6728d4
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_t-instead-of-int.patch
@@ -0,0 +1,14 @@
+Import Debian patches and fix a lot of real bugs. 
+
+Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
+--- iperf-2.0.4.orig/src/Settings.cpp.orig	2008-04-08 04:37:54.000000000 +0200
++++ iperf-2.0.4/src/Settings.cpp	2008-05-07 17:41:03.923942801 +0200
+@@ -458,7 +458,7 @@
+         case 't': // seconds to write for
+             // time mode (instead of amount mode)
+             setModeTime( mExtSettings );
+-            mExtSettings->mAmount = (int) (atof( optarg ) * 100.0);
++            mExtSettings->mAmount = (max_size_t) (atof( optarg ) * 100.0);
+             break;
+ 
+         case 'u': // UDP instead of TCP
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-as-minus-sign.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-as-minus-sign.patch
new file mode 100644
index 0000000..929b5ac
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-as-minus-sign.patch
@@ -0,0 +1,178 @@
+Import Debian patches and fix a lot of real bugs. 
+
+Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
+
+--- iperf-2.0.4.orig/man/iperf.1	2008-08-21 00:21:49.290527643 +0200
++++ iperf-2.0.4/man/iperf.1	2008-08-21 00:35:17.850640445 +0200
+@@ -2,21 +2,21 @@
+ .SH NAME
+ iperf \- perform network throughput tests
+ .SH SYNOPSIS
+-.B iperf -s [
++.B iperf \-s [
+ .I options
+ .B ]
+ 
+-.B iperf -c 
++.B iperf \-c 
+ .I server
+ .B [
+ .I options
+ .B ]
+ 
+-.B iperf -u -s [
++.B iperf \-u \-s [
+ .I options
+ .B ]
+ 
+-.B iperf -u -c 
++.B iperf \-u \-c 
+ .I server
+ .B [
+ .I options
+@@ -28,103 +28,103 @@
+ traffic).  
+ .SH "GENERAL OPTIONS"
+ .TP
+-.BR -f ", " --format " "
++.BR \-f ", " \-\-format " "
+ [kmKM]   format to report: Kbits, Mbits, KBytes, MBytes
+ .TP
+-.BR -h ", " --help " "
++.BR \-h ", " \-\-help " "
+ print a help synopsis
+ .TP
+-.BR -i ", " --interval " \fIn\fR"
++.BR \-i ", " \-\-interval " \fIn\fR"
+ pause \fIn\fR seconds between periodic bandwidth reports
+ .TP
+-.BR -l ", " --len " \fIn\fR[KM]"
++.BR \-l ", " \-\-len " \fIn\fR[KM]"
+ set length read/write buffer to \fIn\fR (default 8 KB)
+ .TP
+-.BR -m ", " --print_mss " "
++.BR \-m ", " \-\-print_mss " "
+ print TCP maximum segment size (MTU - TCP/IP header)
+ .TP
+-.BR -o ", " --output " <filename>"
++.BR \-o ", " \-\-output " <filename>"
+ output the report or error message to this specified file
+ .TP
+-.BR -p ", " --port " \fIn\fR"
++.BR \-p ", " \-\-port " \fIn\fR"
+ set server port to listen on/connect to to \fIn\fR (default 5001)
+ .TP
+-.BR -u ", " --udp " "
++.BR \-u ", " \-\-udp " "
+ use UDP rather than TCP
+ .TP
+-.BR -w ", " --window " \fIn\fR[KM]"
++.BR \-w ", " \-\-window " \fIn\fR[KM]"
+ TCP window size (socket buffer size)
+ .TP
+-.BR -B ", " --bind " <host>"
++.BR \-B ", " \-\-bind " <host>"
+ bind to <host>, an interface or multicast address
+ .TP
+-.BR -C ", " --compatibility " "
++.BR \-C ", " \-\-compatibility " "
+ for use with older versions does not sent extra msgs
+ .TP
+-.BR -M ", " --mss " \fIn\fR"
++.BR \-M ", " \-\-mss " \fIn\fR"
+ set TCP maximum segment size (MTU - 40 bytes)
+ .TP
+-.BR -N ", " --nodelay " "
++.BR \-N ", " \-\-nodelay " "
+ set TCP no delay, disabling Nagle's Algorithm
+ .TP
+-.BR -v ", " --version " "
++.BR \-v ", " \-\-version " "
+ print version information and quit
+ .TP
+-.BR -V ", " --IPv6Version " "
++.BR \-V ", " \-\-IPv6Version " "
+ Set the domain to IPv6
+ .TP
+-.BR -x ", " --reportexclude " "
++.BR \-x ", " \-\-reportexclude " "
+ [CDMSV]   exclude C(connection) D(data) M(multicast) S(settings) V(server) reports
+ .TP
+-.BR -y ", " --reportstyle " C|c"
++.BR \-y ", " \-\-reportstyle " C|c"
+ if set to C or c report results as CSV (comma separated values)
+ .SH "SERVER SPECIFIC OPTIONS"
+ .TP
+-.BR -s ", " --server " "
++.BR \-s ", " \-\-server " "
+ run in server mode
+ .TP
+-.BR -U ", " --single_udp " "
++.BR \-U ", " \-\-single_udp " "
+ run in single threaded UDP mode
+ .TP
+-.BR -D ", " --daemon " "
++.BR \-D ", " \-\-daemon " "
+ run the server as a daemon
+ .SH "CLIENT SPECIFIC OPTIONS"
+ .TP
+-.BR -b ", " --bandwidth " \fIn\fR[KM]"
++.BR \-b ", " \-\-bandwidth " \fIn\fR[KM]"
+ set target bandwidth to \fIn\fR bits/sec (default 1 Mbit/sec).
+-This setting requires UDP (-u).
++This setting requires UDP (\-u).
+ .TP
+-.BR -c ", " --client " <host>"
++.BR \-c ", " \-\-client " <host>"
+ run in client mode, connecting to <host>
+ .TP
+-.BR -d ", " --dualtest " "
++.BR \-d ", " \-\-dualtest " "
+ Do a bidirectional test simultaneously
+ .TP
+-.BR -n ", " --num " \fIn\fR[KM]"
+-number of bytes to transmit (instead of -t)
++.BR \-n ", " \-\-num " \fIn\fR[KM]"
++number of bytes to transmit (instead of \-t)
+ .TP
+-.BR -r ", " --tradeoff " "
++.BR \-r ", " \-\-tradeoff " "
+ Do a bidirectional test individually
+ .TP
+-.BR -t ", " --time " \fIn\fR"
++.BR \-t ", " \-\-time " \fIn\fR"
+ time in seconds to transmit for (default 10 secs)
+ .TP
+-.BR -F ", " --fileinput " <name>"
++.BR \-F ", " \-\-fileinput " <name>"
+ input the data to be transmitted from a file
+ .TP
+-.BR -I ", " --stdin " "
++.BR \-I ", " \-\-stdin " "
+ input the data to be transmitted from stdin
+ .TP
+-.BR -L ", " --listenport " \fIn\fR"
++.BR \-L ", " \-\-listenport " \fIn\fR"
+ port to recieve bidirectional tests back on
+ .TP
+-.BR -P ", " --parallel " \fIn\fR"
++.BR \-P ", " \-\-parallel " \fIn\fR"
+ number of parallel client threads to run
+ .TP
+-.BR -T ", " --ttl " \fIn\fR"
++.BR \-T ", " \-\-ttl " \fIn\fR"
+ time-to-live, for multicast (default 1)
+ .TP
+-.BR -Z ", " --linux-congestion " <algo>"
++.BR \-Z ", " \-\-linux\-congestion " <algo>"
+ set TCP congestion control algorithm (Linux only)
+ .SH ENVIRONMENT
+ .TP
+@@ -143,6 +143,6 @@
+ Kevin Gibbs,
+ John Estabrook <jestabro at ncsa.uiuc.edu>,
+ Andrew Gallatin <gallatin at gmail.com>,
+-Stephen Hemminger <shemminger at linux-foundation.org>
++Stephen Hemminger <shemminger at linux\-foundation.org>
+ .SH "SEE ALSO"
+ http://iperf.sourceforge.net/
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind-fail.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind-fail.patch
new file mode 100644
index 0000000..ec13d6b
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind-fail.patch
@@ -0,0 +1,15 @@
+Import Debian patches and fix a lot of real bugs. 
+
+Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
+
+--- iperf-2.0.4/src/Listener.cpp	2009-02-23 16:20:31.000000000 -0500
++++ iperf-2.0.4-fixed/src/Listener.cpp	2009-02-23 16:20:40.000000000 -0500
+@@ -333,7 +333,7 @@
+ #endif
+     {
+         rc = bind( mSettings->mSock, (sockaddr*) &mSettings->local, mSettings->size_local );
+-        WARN_errno( rc == SOCKET_ERROR, "bind" );
++        FAIL_errno( rc == SOCKET_ERROR, "bind", mSettings );
+     }
+     // listen for connections (TCP only).
+     // default backlog traditionally 5
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-deadlock.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-deadlock.patch
new file mode 100644
index 0000000..4b5f914
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-deadlock.patch
@@ -0,0 +1,68 @@
+by Kirby Zhou < kirbyzhou \x40 sohu-rd.com >
+add a Condition_Wait_Event for ReporterDoneCond
+
+Upstream-Status: Inappropriate [not author]
+
+--- iperf-2.0.4.orig/include/Condition.h	2007-08-30 00:06:19.000000000 +0200
++++ iperf-2.0.4/include/Condition.h	2009-07-06 11:45:02.407700310 +0200
+@@ -115,6 +115,11 @@ typedef struct Condition {
+     // sleep this thread, waiting for condition signal
+ #if   defined( HAVE_POSIX_THREAD )
+     #define Condition_Wait( Cond ) pthread_cond_wait( &(Cond)->mCondition, &(Cond)->mMutex )
++    #define Condition_Wait_Event( Cond ) do { \
++        Mutex_Lock( &(Cond)->mMutex ); \
++        pthread_cond_wait( &(Cond)->mCondition, &(Cond)->mMutex ); \
++        Mutex_Unlock( &(Cond)->mMutex ); \
++    } while ( 0 )
+ #elif defined( HAVE_WIN32_THREAD )
+     // atomically release mutex and wait on condition,                      
+     // then re-acquire the mutex
+@@ -122,6 +127,10 @@ typedef struct Condition {
+         SignalObjectAndWait( (Cond)->mMutex, (Cond)->mCondition, INFINITE, false ); \
+         Mutex_Lock( &(Cond)->mMutex );                          \
+     } while ( 0 )
++    #define Condition_Wait_Event( Cond ) do { \
++        Mutex_Lock( &(Cond)->mMutex ); \
++        SignalObjectAndWait( (Cond)->mMutex, (Cond)->mCondition, INFINITE, false ); \
++    } while ( 0 )
+ #else
+     #define Condition_Wait( Cond )
+ #endif
+--- iperf-2.0.4.orig/src/Reporter.c	2009-07-06 11:49:05.996443011 +0200
++++ iperf-2.0.4/src/Reporter.c	2009-07-06 11:46:52.919699530 +0200
+@@ -339,7 +339,7 @@ void ReportPacket( ReportHeader* agent, 
+             // item
+             while ( index == 0 ) {
+                 Condition_Signal( &ReportCond );
+-                Condition_Wait( &ReportDoneCond );
++                Condition_Wait_Event( &ReportDoneCond );
+                 index = agent->reporterindex;
+             }
+             agent->agentindex = 0;
+@@ -347,7 +347,7 @@ void ReportPacket( ReportHeader* agent, 
+         // Need to make sure that reporter is not about to be "lapped"
+         while ( index - 1 == agent->agentindex ) {
+             Condition_Signal( &ReportCond );
+-            Condition_Wait( &ReportDoneCond );
++            Condition_Wait_Event( &ReportDoneCond );
+             index = agent->reporterindex;
+         }
+ 
+@@ -391,7 +391,7 @@ void EndReport( ReportHeader *agent ) {
+     if ( agent != NULL ) {
+         int index = agent->reporterindex;
+         while ( index != -1 ) {
+-            Condition_Wait( &ReportDoneCond );
++            Condition_Wait_Event( &ReportDoneCond );
+             index = agent->reporterindex;
+         }
+         agent->agentindex = -1;
+@@ -412,7 +412,7 @@ void EndReport( ReportHeader *agent ) {
+ Transfer_Info *GetReport( ReportHeader *agent ) {
+     int index = agent->reporterindex;
+     while ( index != -1 ) {
+-        Condition_Wait( &ReportDoneCond );
++        Condition_Wait_Event( &ReportDoneCond );
+         index = agent->reporterindex;
+     }
+     return &agent->report.info;
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
new file mode 100644
index 0000000..c5d85b1
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
@@ -0,0 +1,15 @@
+by Kirby Zhou < kirbyzhou \x40 sohu-rd.com >
+increase the queue length to avoid thread racing
+
+Upstream-Status: Inappropriate [not author]
+--- iperf-2.0.4.orig/include/Reporter.h	2008-04-08 04:37:54.000000000 +0200
++++ iperf-2.0.4/include/Reporter.h	2009-07-06 11:53:58.700541554 +0200
+@@ -61,7 +61,7 @@ struct server_hdr;
+ 
+ #include "Settings.hpp"
+ 
+-#define NUM_REPORT_STRUCTS 700
++#define NUM_REPORT_STRUCTS 5700
+ #define NUM_MULTI_SLOTS    5
+ 
+ #ifdef __cplusplus
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
new file mode 100644
index 0000000..7e5f1bf
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
+HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
+SECTION = "console/network"
+LICENSE = "NewBSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
+
+PR = "r0"
+
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \
+            file://000-Iperf_Fix-CPU-Usage.diff \
+            file://001-cast-to-max_size_t-instead-of-int.patch \
+            file://003-fix-hyphen-used-as-minus-sign.patch \
+            file://005-iperf-die-on-bind-fail.patch \
+            file://007-iperf-reporter-deadlock.patch \
+            file://008-numofreport.patch \
+	"
+
+SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
+
+inherit autotools
+
+S="${WORKDIR}/iperf-${PV}"
+
+EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+do_configure() {
+	export ac_cv_func_malloc_0_nonnull=yes
+	gnu-configize
+	oe_runconf
+}
+
+do_compile() {
+	cd ${WORKDIR}/iperf-${PV}
+	oe_runmake
+}
+
+do_install() {
+	cd ${WORKDIR}/iperf-${PV}/src
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.7.0.4


