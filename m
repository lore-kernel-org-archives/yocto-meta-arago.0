Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9FB5F52A6D
	for <meta-arago@arago-project.org>;
	Wed, 14 Jan 2015 20:53:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0EKrmJ6021444
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:53:48 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0EKrmD2015359
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:53:48 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 14 Jan 2015 14:53:48 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] syslog-ng: Add recipe for syslog-ng from
	meta-openembedded master
Thread-Index: AQHQMBtpPlTJW3yYD0qGdc2U5S4QwJzAewSA//+cmaA=
Date: Wed, 14 Jan 2015 20:53:48 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580F8F14@DLEE11.ent.ti.com>
References: <1421254747-29545-1-git-send-email-sam.nelson@ti.com>
	<20150114204734.GI4759@edge>
In-Reply-To: <20150114204734.GI4759@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] syslog-ng: Add recipe for syslog-ng from meta-openembedded master
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
X-List-Received-Date: Wed, 14 Jan 2015 20:53:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It is exact copy ( from meta-openembedded master). No changes.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, January 14, 2015 3:48 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] syslog-ng: Add recipe for syslog-ng fro=
m
> meta-openembedded master
>=20
> Sam,
>=20
> Is this verbatim copy of the existing recipe and patches or did you make =
any
> changes on top?
>=20
> --
> Denys
>=20
>=20
> On Wed, Jan 14, 2015 at 11:59:07AM -0500, Sam Nelson wrote:
> > - This is not currently available in daisy branch, temporarily adding h=
ere
> >   Can be removed when moving to latest version of meta-openmbedded
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../Fix-the-memory-leak-problem-for-mutex.patch    |   58 +++
> >  ...ry-leak-problem-when-HAVE_ENVIRON-defined.patch |   27 ++
> >  .../files/afsql-afsql_dd_insert_db-refactor.patch  |  494
> ++++++++++++++++++++
> >  ...c-add-option-enable-thread-tls-to-manage-.patch |   50 ++
> >  .../syslog-ng/files/configure.patch                |   23 +
> >  .../recipes-support/syslog-ng/files/dbifix.patch   |   20 +
> >  ...init-the-new-config-when-reverting-to-the.patch |   36 ++
> >  .../fix-a-memory-leak-in-log_driver_free.patch     |   33 ++
> >  .../syslog-ng/files/fix-config-libnet.patch        |   66 +++
> >  .../syslog-ng/files/fix-invalid-ownership.patch    |   28 ++
> >  .../files/free-global-LogTemplateOptions.patch     |   30 ++
> >  .../recipes-support/syslog-ng/files/initscript     |   62 +++
> >  .../logwriter-dont-allocate-a-new-buffer.patch     |   26 ++
> >  .../rewrite-expr-grammar.ym-Free-up-token.patch    |   17 +
> >  .../files/still-free-the-unconsumed-item.patch     |   90 ++++
> >  .../syslog-ng-verify-the-list-before-del.patch     |   38 ++
> >  .../recipes-support/syslog-ng/files/syslog-ng.conf |  155 ++++++
> >  .../syslog-ng/files/volatiles.03_syslog-ng         |    1 +
> >  .../recipes-support/syslog-ng/syslog-ng.inc        |  106 +++++
> >  .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |   21 +
> >  20 files changed, 1381 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/Fix-the-memory-leak-problem-for-mutex.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/afsql-afsql_dd_insert_db-refactor.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/configure.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/dbifix.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/deinit-the-new-config-when-reverting-to-the.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/fix-a-memory-leak-in-log_driver_free.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/fix-config-libnet.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/fix-invalid-ownership.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/free-global-LogTemplateOptions.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/initscript
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/logwriter-dont-allocate-a-new-buffer.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/still-free-the-unconsumed-item.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/syslog-ng-verify-the-list-before-del.patch
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/syslog-ng.conf
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-
> ng/files/volatiles.03_syslog-ng
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-ng/syslog-
> ng.inc
> >  create mode 100644 meta-arago-extras/recipes-support/syslog-ng/syslog-
> ng_3.5.4.1.bb
> >
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/Fix-the-
> memory-leak-problem-for-mutex.patch b/meta-arago-extras/recipes-
> support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
> > new file mode 100644
> > index 0000000..89022aa
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/Fix-the-memory-
> leak-problem-for-mutex.patch
> > @@ -0,0 +1,58 @@
> > +Fix the memory leak problem for mutex
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +---
> > + lib/logqueue.c               |    1 +
> > + modules/affile/affile-dest.c |    2 ++
> > + modules/dbparser/dbparser.c  |    1 +
> > + 3 files changed, 4 insertions(+), 0 deletions(-)
> > +
> > +diff --git a/lib/logqueue.c b/lib/logqueue.c
> > +index 337a3c1..10edcf0 100644
> > +--- a/lib/logqueue.c
> > ++++ b/lib/logqueue.c
> > +@@ -188,6 +188,7 @@ log_queue_init_instance(LogQueue *self, const
> gchar *persist_name)
> > + void
> > + log_queue_free_method(LogQueue *self)
> > + {
> > ++  g_static_mutex_free(&self->lock);
> > +   g_free(self->persist_name);
> > +   g_free(self);
> > + }
> > +diff --git a/modules/affile/affile-dest.c b/modules/affile/affile-dest=
.c
> > +index a2bcdad..ce79f6f 100644
> > +--- a/modules/affile/affile-dest.c
> > ++++ b/modules/affile/affile-dest.c
> > +@@ -305,6 +305,7 @@ affile_dw_free(LogPipe *s)
> > + {
> > +   AFFileDestWriter *self =3D (AFFileDestWriter *) s;
> > +
> > ++  g_static_mutex_free(&self->lock);
> > +   log_pipe_unref((LogPipe *) self->writer);
> > +   self->writer =3D NULL;
> > +   g_free(self->filename);
> > +@@ -687,6 +688,7 @@ affile_dd_free(LogPipe *s)
> > +   /* NOTE: this must be NULL as deinit has freed it, otherwise we'd h=
ave
> circular references */
> > +   g_assert(self->single_writer =3D=3D NULL && self->writer_hash =3D=
=3D NULL);
> > +
> > ++  g_static_mutex_free(&self->lock);
> > +   log_template_unref(self->filename_template);
> > +   log_writer_options_destroy(&self->writer_options);
> > +   log_dest_driver_free(s);
> > +diff --git a/modules/dbparser/dbparser.c b/modules/dbparser/dbparser.c
> > +index f1248b5..9775701 100644
> > +--- a/modules/dbparser/dbparser.c
> > ++++ b/modules/dbparser/dbparser.c
> > +@@ -284,6 +284,7 @@ log_db_parser_free(LogPipe *s)
> > + {
> > +   LogDBParser *self =3D (LogDBParser *) s;
> > +
> > ++  g_static_mutex_free(&self->lock);
> > +   if (self->db)
> > +     pattern_db_free(self->db);
> > +
> > +--
> > +1.7.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/Fix-the-
> memory-leak-problem-when-HAVE_ENVIRON-defined.patch b/meta-arago-
> extras/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-
> HAVE_ENVIRON-defined.patch
> > new file mode 100644
> > index 0000000..2ac9c0b
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/Fix-the-memory-
> leak-problem-when-HAVE_ENVIRON-defined.patch
> > @@ -0,0 +1,27 @@
> > +Fix the memory leak problem when HAVE_ENVIRON is defined
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +---
> > +--- a/lib/gprocess.c
> > ++++ b/lib/gprocess.c
> > +@@ -1421,6 +1421,18 @@
> > + void
> > + g_process_finish(void)
> > + {
> > ++#ifdef HAVE_ENVIRON
> > ++  int i =3D 0;
> > ++
> > ++  while (environ[i]) {
> > ++    g_free(environ[i]);
> > ++    ++i;
> > ++  }
> > ++  if (environ)
> > ++    g_free(environ);
> > ++  if (process_opts.argv_orig)
> > ++    free(process_opts.argv_orig);
> > ++#endif
> > +   g_process_remove_pidfile();
> > + }
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/afsql-
> afsql_dd_insert_db-refactor.patch b/meta-arago-extras/recipes-
> support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
> > new file mode 100644
> > index 0000000..42e181b
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/afsql-
> afsql_dd_insert_db-refactor.patch
> > @@ -0,0 +1,494 @@
> > +From 23e80b75508187baaa823a68ea019b72e0b2305c Mon Sep 17
> 00:00:00 2001
> > +From: Budai Laszlo <lbudai@balabit.hu>
> > +Date: Tue, 12 Nov 2013 13:19:04 +0100
> > +Subject: [PATCH] afsql: afsql_dd_insert_db() refactor
> > +
> > +Upstream-Status: Backport
> > +
> > +A lot of the code that was previously in afsql_dd_insert_db() have bee=
n
> > +extracted to smaller functions, and afsql_dd_insert_db() was rebuilt o=
n
> > +top of these. At the same time, memory leaks were plugged, and in case
> > +of a transaction error, backlog rewinding has been fixed too, to not
> > +loose messages since the last BEGIN command.
> > +
> > +Signed-off-by: Juhasz Viktor <jviktor@balabit.hu>
> > +Signed-off-by: Laszlo Budai <lbudai@balabit.hu>
> > +---
> > + modules/afsql/afsql.c | 301 ++++++++++++++++++++++++++++++++--------
> ----------
> > + 1 file changed, 192 insertions(+), 109 deletions(-)
> > +
> > +diff --git a/modules/afsql/afsql.c b/modules/afsql/afsql.c
> > +index 12f6aab..a6a8190 100644
> > +--- a/modules/afsql/afsql.c
> > ++++ b/modules/afsql/afsql.c
> > +@@ -456,24 +456,21 @@ afsql_dd_create_index(AFSqlDestDriver *s
> > +  *
> > +  * NOTE: This function can only be called from the database thread.
> > +  **/
> > +-static GString *
> > +-afsql_dd_validate_table(AFSqlDestDriver *self, LogMessage *msg)
> > ++static gboolean
> > ++afsql_dd_validate_table(AFSqlDestDriver *self, GString *table)
> > + {
> > +-  GString *query_string, *table;
> > ++  GString *query_string;
> > +   dbi_result db_res;
> > +   gboolean success =3D FALSE;
> > +   gint i;
> > +
> > +-  table =3D g_string_sized_new(32);
> > +-  log_template_format(self->table, msg, &self->template_options,
> LTZ_LOCAL, 0, NULL, table);
> > +-
> > +   if (self->flags & AFSQL_DDF_DONT_CREATE_TABLES)
> > +-    return table;
> > ++    return TRUE;
> > +
> > +   afsql_dd_check_sql_identifier(table->str, TRUE);
> > +
> > +   if (g_hash_table_lookup(self->validated_tables, table->str))
> > +-    return table;
> > ++    return TRUE;
> > +
> > +   query_string =3D g_string_sized_new(32);
> > +   g_string_printf(query_string, "SELECT * FROM %s WHERE 0=3D1", table=
-
> >str);
> > +@@ -544,14 +541,9 @@ afsql_dd_validate_table(AFSqlDestDriver
> > +       /* we have successfully created/altered the destination table, =
record
> this information */
> > +       g_hash_table_insert(self->validated_tables, g_strdup(table->str=
),
> GUINT_TO_POINTER(TRUE));
> > +     }
> > +-  else
> > +-    {
> > +-      g_string_free(table, TRUE);
> > +-      table =3D NULL;
> > +-    }
> > +   g_string_free(query_string, TRUE);
> > +
> > +-  return table;
> > ++  return success;
> > + }
> > +
> > + /**
> > +@@ -581,6 +573,20 @@ afsql_dd_begin_txn(AFSqlDestDriver *self
> > + }
> > +
> > + /**
> > ++ * afsql_dd_handle_transaction_error:
> > ++ *
> > ++ * Handle errors inside during a SQL transaction (e.g. INSERT or COMM=
IT
> failures).
> > ++ *
> > ++ * NOTE: This function can only be called from the database thread.
> > ++ **/
> > ++static void
> > ++afsql_dd_handle_transaction_error(AFSqlDestDriver *self)
> > ++{
> > ++  log_queue_rewind_backlog(self->queue);
> > ++  self->flush_lines_queued =3D 0;
> > ++}
> > ++
> > ++/**
> > +  * afsql_dd_begin_txn:
> > +  *
> > +  * Commit SQL transaction.
> > +@@ -596,14 +602,14 @@ afsql_dd_commit_txn(AFSqlDestDriver *sel
> > +   if (success)
> > +     {
> > +       log_queue_ack_backlog(self->queue, self->flush_lines_queued);
> > ++      self->flush_lines_queued =3D 0;
> > +     }
> > +   else
> > +     {
> > +-      msg_notice("SQL transaction commit failed, rewinding backlog an=
d
> starting again",
> > +-                 NULL);
> > +-      log_queue_rewind_backlog(self->queue);
> > ++      msg_error("SQL transaction commit failed, rewinding backlog and
> starting again",
> > ++                NULL);
> > ++      afsql_dd_handle_transaction_error(self);
> > +     }
> > +-  self->flush_lines_queued =3D 0;
> > +   return success;
> > + }
> > +
> > +@@ -644,12 +650,13 @@ afsql_dd_set_dbd_opt_numeric(gpointer ke
> > + }
> > +
> > + static gboolean
> > +-afsql_dd_connect(AFSqlDestDriver *self)
> > ++afsql_dd_ensure_initialized_connection(AFSqlDestDriver *self)
> > + {
> > +   if (self->dbi_ctx)
> > +     return TRUE;
> > +
> > +   self->dbi_ctx =3D dbi_conn_new(self->type);
> > ++
> > +   if (!self->dbi_ctx)
> > +     {
> > +       msg_error("No such DBI driver",
> > +@@ -659,10 +666,12 @@ afsql_dd_connect(AFSqlDestDriver *self)
> > +     }
> > +
> > +   dbi_conn_set_option(self->dbi_ctx, "host", self->host);
> > ++
> > +   if (strcmp(self->type, "mysql"))
> > +     dbi_conn_set_option(self->dbi_ctx, "port", self->port);
> > +   else
> > +     dbi_conn_set_option_numeric(self->dbi_ctx, "port", atoi(self->por=
t));
> > ++
> > +   dbi_conn_set_option(self->dbi_ctx, "username", self->user);
> > +   dbi_conn_set_option(self->dbi_ctx, "password", self->password);
> > +   dbi_conn_set_option(self->dbi_ctx, "dbname", self->database);
> > +@@ -691,6 +700,7 @@ afsql_dd_connect(AFSqlDestDriver *self)
> > +                 evt_tag_str("database", self->database),
> > +                 evt_tag_str("error", dbi_error),
> > +                 NULL);
> > ++
> > +       return FALSE;
> > +     }
> > +
> > +@@ -713,104 +723,145 @@ afsql_dd_connect(AFSqlDestDriver *self)
> > +   return TRUE;
> > + }
> > +
> > +-static gboolean
> > +-afsql_dd_insert_fail_handler(AFSqlDestDriver *self, LogMessage *msg,
> > +-                             LogPathOptions *path_options)
> > ++static GString *
> > ++afsql_dd_ensure_accessible_database_table(AFSqlDestDriver *self,
> LogMessage *msg)
> > + {
> > +-  if (self->failed_message_counter < self->num_retries - 1)
> > +-    {
> > +-      log_queue_push_head(self->queue, msg, path_options);
> > +-
> > +-      /* database connection status sanity check after failed query *=
/
> > +-      if (dbi_conn_ping(self->dbi_ctx) !=3D 1)
> > +-        {
> > +-          const gchar *dbi_error;
> > +-
> > +-          dbi_conn_error(self->dbi_ctx, &dbi_error);
> > +-          msg_error("Error, no SQL connection after failed query atte=
mpt",
> > +-                    evt_tag_str("type", self->type),
> > +-                    evt_tag_str("host", self->host),
> > +-                    evt_tag_str("port", self->port),
> > +-                    evt_tag_str("username", self->user),
> > +-                    evt_tag_str("database", self->database),
> > +-                    evt_tag_str("error", dbi_error),
> > +-                    NULL);
> > +-          return FALSE;
> > +-        }
> > ++  GString *table =3D g_string_sized_new(32);
> > ++  log_template_format(self->table, msg, &self->template_options,
> LTZ_LOCAL, 0, NULL, table);
> > +
> > +-      self->failed_message_counter++;
> > +-      return FALSE;
> > ++  if (!afsql_dd_validate_table(self, table))
> > ++    {
> > ++      /* If validate table is FALSE then close the connection and wai=
t
> time_reopen time (next call) */
> > ++      msg_error("Error checking table, disconnecting from database, t=
rying
> again shortly",
> > ++                evt_tag_int("time_reopen", self->time_reopen),
> > ++                NULL);
> > ++      g_string_free(table, TRUE);
> > ++      return NULL;
> > +     }
> > +
> > +-  msg_error("Multiple failures while inserting this record into the
> database, message dropped",
> > +-            evt_tag_int("attempts", self->num_retries),
> > +-            NULL);
> > +-  stats_counter_inc(self->dropped_messages);
> > +-  log_msg_drop(msg, path_options);
> > +-  self->failed_message_counter =3D 0;
> > +-  return TRUE;
> > ++  return table;
> > + }
> > +
> > + static GString *
> > +-afsql_dd_construct_query(AFSqlDestDriver *self, GString *table,
> > +-                         LogMessage *msg)
> > ++afsql_dd_build_insert_command(AFSqlDestDriver *self, LogMessage
> *msg, GString *table)
> > + {
> > +-  GString *value;
> > +-  GString *query_string;
> > +-  gint i;
> > ++  GString *insert_command =3D g_string_sized_new(256);
> > ++  GString *value =3D g_string_sized_new(512);
> > ++  gint i, j;
> > +
> > +-  value =3D g_string_sized_new(256);
> > +-  query_string =3D g_string_sized_new(512);
> > ++  g_string_printf(insert_command, "INSERT INTO %s (", table->str);
> > +
> > +-  g_string_printf(query_string, "INSERT INTO %s (", table->str);
> > +   for (i =3D 0; i < self->fields_len; i++)
> > +     {
> > +-      g_string_append(query_string, self->fields[i].name);
> > +-      if (i !=3D self->fields_len - 1)
> > +-        g_string_append(query_string, ", ");
> > ++      if ((self->fields[i].flags & AFSQL_FF_DEFAULT) =3D=3D 0 && self=
-
> >fields[i].value !=3D NULL)
> > ++        {
> > ++           g_string_append(insert_command, self->fields[i].name);
> > ++
> > ++           j =3D i + 1;
> > ++           while (j < self->fields_len && (self->fields[j].flags &
> AFSQL_FF_DEFAULT) =3D=3D AFSQL_FF_DEFAULT)
> > ++             j++;
> > ++
> > ++           if (j < self->fields_len)
> > ++             g_string_append(insert_command, ", ");
> > ++        }
> > +     }
> > +-  g_string_append(query_string, ") VALUES (");
> > ++
> > ++  g_string_append(insert_command, ") VALUES (");
> > +
> > +   for (i =3D 0; i < self->fields_len; i++)
> > +     {
> > +       gchar *quoted;
> > +
> > +-      if (self->fields[i].value =3D=3D NULL)
> > +-        {
> > +-          /* the config used the 'default' value for this column -> t=
he
> fields[i].value is NULL, use SQL default */
> > +-          g_string_append(query_string, "DEFAULT");
> > +-        }
> > +-      else
> > ++      if ((self->fields[i].flags & AFSQL_FF_DEFAULT) =3D=3D 0 && self=
-
> >fields[i].value !=3D NULL)
> > +         {
> > +           log_template_format(self->fields[i].value, msg, &self-
> >template_options, LTZ_SEND, self->seq_num, NULL, value);
> > +-
> > +           if (self->null_value && strcmp(self->null_value, value->str=
) =3D=3D 0)
> > +             {
> > +-              g_string_append(query_string, "NULL");
> > ++              g_string_append(insert_command, "NULL");
> > +             }
> > +           else
> > +             {
> > +               dbi_conn_quote_string_copy(self->dbi_ctx, value->str, &=
quoted);
> > +               if (quoted)
> > +                 {
> > +-                  g_string_append(query_string, quoted);
> > ++                  g_string_append(insert_command, quoted);
> > +                   free(quoted);
> > +                 }
> > +               else
> > +                 {
> > +-                  g_string_append(query_string, "''");
> > ++                 g_string_append(insert_command, "''");
> > +                 }
> > +             }
> > +-        }
> > +
> > +-      if (i !=3D self->fields_len - 1)
> > +-        g_string_append(query_string, ", ");
> > ++          j =3D i + 1;
> > ++          while (j < self->fields_len && (self->fields[j].flags &
> AFSQL_FF_DEFAULT) =3D=3D AFSQL_FF_DEFAULT)
> > ++            j++;
> > ++          if (j < self->fields_len)
> > ++            g_string_append(insert_command, ", ");
> > ++        }
> > +     }
> > +-  g_string_append(query_string, ")");
> > ++
> > ++  g_string_append(insert_command, ")");
> > +
> > +   g_string_free(value, TRUE);
> > +
> > +-  return query_string;
> > ++  return insert_command;
> > ++}
> > ++
> > ++static inline gboolean
> > ++afsql_dd_is_transaction_handling_enabled(const AFSqlDestDriver *self)
> > ++{
> > ++  return self->flush_lines_queued !=3D -1;
> > ++}
> > ++
> > ++static inline gboolean
> > ++afsql_dd_should_start_new_transaction(const AFSqlDestDriver *self)
> > ++{
> > ++  return self->flush_lines_queued =3D=3D 0;
> > ++}
> > ++
> > ++static inline gboolean
> > ++afsql_dd_should_commit_transaction(const AFSqlDestDriver *self)
> > ++{
> > ++  return afsql_dd_is_transaction_handling_enabled(self) && self-
> >flush_lines_queued =3D=3D self->flush_lines;
> > ++}
> > ++
> > ++static inline gboolean
> >
> ++afsql_dd_handle_insert_row_error_depending_on_connection_availabili
> ty(AFSqlDestDriver *self,
> > ++                                                                     =
 LogMessage *msg,
> > ++                                                                     =
 LogPathOptions *path_options)
> > ++{
> > ++  const gchar *dbi_error, *error_message;
> > ++
> > ++  if (dbi_conn_ping(self->dbi_ctx) =3D=3D 1)
> > ++    {
> > ++      log_queue_push_head(self->queue, msg, path_options);
> > ++      return TRUE;
> > ++    }
> > ++
> > ++  if (afsql_dd_is_transaction_handling_enabled(self))
> > ++    {
> > ++      error_message =3D "SQL connection lost in the middle of a trans=
action,"
> > ++                      " rewinding backlog and starting again";
> > ++      afsql_dd_handle_transaction_error(self);
> > ++    }
> > ++  else
> > ++    {
> > ++      error_message =3D "Error, no SQL connection after failed query
> attempt";
> > ++      log_queue_push_head(self->queue, msg, path_options);
> > ++    }
> > ++
> > ++  dbi_conn_error(self->dbi_ctx, &dbi_error);
> > ++  msg_error(error_message,
> > ++            evt_tag_str("type", self->type),
> > ++            evt_tag_str("host", self->host),
> > ++            evt_tag_str("port", self->port),
> > ++            evt_tag_str("username", self->user),
> > ++            evt_tag_str("database", self->database),
> > ++            evt_tag_str("error", dbi_error),
> > ++            NULL);
> > ++
> > ++  return FALSE;
> > + }
> > +
> > + /**
> > +@@ -824,61 +875,93 @@ afsql_dd_construct_query(AFSqlDestDriver
> > + static gboolean
> > + afsql_dd_insert_db(AFSqlDestDriver *self)
> > + {
> > +-  GString *table, *query_string;
> > ++  GString *table =3D NULL;
> > ++  GString *insert_command =3D NULL;
> > +   LogMessage *msg;
> > +   gboolean success;
> > +   LogPathOptions path_options =3D LOG_PATH_OPTIONS_INIT;
> > +
> > +-  afsql_dd_connect(self);
> > ++  if (!afsql_dd_ensure_initialized_connection(self))
> > ++    return FALSE;
> > +
> > +-  success =3D log_queue_pop_head(self->queue, &msg, &path_options,
> (self->flags & AFSQL_DDF_EXPLICIT_COMMITS), FALSE);
> > ++  /* connection established, try to insert a message */
> > ++  success =3D log_queue_pop_head(self->queue, &msg, &path_options,
> FALSE, self->flags & AFSQL_DDF_EXPLICIT_COMMITS);
> > +   if (!success)
> > +     return TRUE;
> > +
> > +   msg_set_context(msg);
> > +
> > +-  table =3D afsql_dd_validate_table(self, msg);
> > ++  table =3D afsql_dd_ensure_accessible_database_table(self, msg);
> > ++
> > +   if (!table)
> > +     {
> > +-      /* If validate table is FALSE then close the connection and wai=
t
> time_reopen time (next call) */
> > +-      msg_error("Error checking table, disconnecting from database, t=
rying
> again shortly",
> > +-                evt_tag_int("time_reopen", self->time_reopen),
> > +-                NULL);
> > +-      msg_set_context(NULL);
> > +-      g_string_free(table, TRUE);
> > +-      return afsql_dd_insert_fail_handler(self, msg, &path_options);
> > ++      success =3D FALSE;
> > ++      goto out;
> > +     }
> > +
> > +-  query_string =3D afsql_dd_construct_query(self, table, msg);
> > ++  if (afsql_dd_should_start_new_transaction(self) &&
> !afsql_dd_begin_txn(self))
> > ++    {
> > ++      success =3D FALSE;
> > ++      goto out;
> > ++    }
> > +
> > +-  if (self->flush_lines_queued =3D=3D 0 && !afsql_dd_begin_txn(self))
> > +-    return FALSE;
> > ++  insert_command =3D afsql_dd_build_insert_command(self, msg, table);
> > ++  success =3D afsql_dd_run_query(self, insert_command->str, FALSE, NU=
LL);
> > +
> > +-  success =3D afsql_dd_run_query(self, query_string->str, FALSE, NULL=
);
> > +   if (success && self->flush_lines_queued !=3D -1)
> > +     {
> > +       self->flush_lines_queued++;
> > +
> > +-      if (self->flush_lines && self->flush_lines_queued =3D=3D self->=
flush_lines
> && !afsql_dd_commit_txn(self))
> > +-        return FALSE;
> > ++      if (afsql_dd_should_commit_transaction(self) &&
> !afsql_dd_commit_txn(self))
> > ++        {
> > ++          /* Assuming that in case of error, the queue is rewound by
> afsql_dd_commit_txn() */
> > ++
> > ++          g_string_free(insert_command, TRUE);
> > ++          msg_set_context(NULL);
> > ++
> > ++          return FALSE;
> > ++        }
> > +     }
> > +
> > +-  g_string_free(table, TRUE);
> > +-  g_string_free(query_string, TRUE);
> > ++ out:
> > ++
> > ++  if (table !=3D NULL)
> > ++    g_string_free(table, TRUE);
> > ++
> > ++  if (insert_command !=3D NULL)
> > ++    g_string_free(insert_command, TRUE);
> > +
> > +   msg_set_context(NULL);
> > +
> > +-  if (!success)
> > +-    return afsql_dd_insert_fail_handler(self, msg, &path_options);
> > ++  if (success)
> > ++    {
> > ++      log_msg_ack(msg, &path_options);
> > ++      log_msg_unref(msg);
> > ++      step_sequence_number(&self->seq_num);
> > ++      self->failed_message_counter =3D 0;
> > ++    }
> > ++  else
> > ++    {
> > ++      if (self->failed_message_counter < self->num_retries - 1)
> > ++        {
> > ++          if
> (!afsql_dd_handle_insert_row_error_depending_on_connection_availabilit
> y(self, msg, &path_options))
> > ++            return FALSE;
> > +
> > +-  /* we only ACK if each INSERT is a separate transaction */
> > +-  if ((self->flags & AFSQL_DDF_EXPLICIT_COMMITS) =3D=3D 0)
> > +-    log_msg_ack(msg, &path_options);
> > +-  log_msg_unref(msg);
> > +-  step_sequence_number(&self->seq_num);
> > +-  self->failed_message_counter =3D 0;
> > ++          self->failed_message_counter++;
> > ++        }
> > ++      else
> > ++        {
> > ++          msg_error("Multiple failures while inserting this record in=
to the
> database, message dropped",
> > ++                    evt_tag_int("attempts", self->num_retries),
> > ++                    NULL);
> > ++          stats_counter_inc(self->dropped_messages);
> > ++          log_msg_drop(msg, &path_options);
> > ++          self->failed_message_counter =3D 0;
> > ++          success =3D TRUE;
> > ++        }
> > ++    }
> > +
> > +-  return TRUE;
> > ++  return success;
> > + }
> > +
> > + static void
> > +@@ -895,7 +978,7 @@ afsql_dd_message_became_available_in_the
> > + static void
> > + afsql_dd_wait_for_suspension_wakeup(AFSqlDestDriver *self)
> > + {
> > +-  /* we got suspended, probably because of a connection error,
> > ++  /* we got suspended, probably because of a connection error,
> > +    * during this time we only get wakeups if we need to be
> > +    * terminated. */
> > +   if (!self->db_thread_terminate)
> > +@@ -974,8 +1057,7 @@ afsql_dd_database_thread(gpointer arg)
> > +
> > +       afsql_dd_commit_txn(self);
> > +     }
> > +-
> > +- exit:
> > ++exit:
> > +   afsql_dd_disconnect(self);
> > +
> > +   msg_verbose("Database thread finished",
> > +--
> > +1.8.4.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/configur=
e.ac-
> add-option-enable-thread-tls-to-manage-.patch b/meta-arago-
> extras/recipes-support/syslog-ng/files/configure.ac-add-option-enable-
> thread-tls-to-manage-.patch
> > new file mode 100644
> > index 0000000..cc8d110
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/configure.ac-ad=
d-
> option-enable-thread-tls-to-manage-.patch
> > @@ -0,0 +1,50 @@
> > +configure.ac: add option --enable-thread-tls to manage thread ssl supp=
ort
> > +
> > +Add option --enable-thread-tls to manage the including of thread
> > +local storage, so we could explicitly disable it.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + configure.ac | 17 +++++++++++------
> > + 1 file changed, 11 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 474e094..cedca54 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -120,6 +120,9 @@ AC_ARG_ENABLE(memtrace,
> > + AC_ARG_ENABLE(ssl,
> > +               [  --enable-ssl        Enable SSL support.],,enable_ssl=
=3D"auto")
> > +
> > ++AC_ARG_ENABLE(thread-tls,
> > ++              [  --enable-thread-tls        Enable Thread Transport L=
ayer Security
> support.],,enable_thread_tls=3D"no")
> > ++
> > + AC_ARG_ENABLE(dynamic-linking,
> > +               [  --enable-dynamic-linking        Link everything
> dynamically.],,enable_dynamic_linking=3D"auto")
> > +
> > +@@ -381,12 +384,14 @@ dnl
> **************************************************************
> *************
> > + dnl Is the __thread keyword available?
> > + dnl
> **************************************************************
> *************
> > +
> > +-AC_LINK_IFELSE([AC_LANG_PROGRAM(
> > +-[[#include <pthread.h>
> > +-__thread int a;
> > +-]],
> > +-[a=3D0;])],
> > +-[ac_cv_have_tls=3Dyes;
> AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Transport
> Layer Security is supported by the system")])
> > ++if test "x$enable_thread_tls" !=3D "xno"; then
> > ++    AC_LINK_IFELSE([AC_LANG_PROGRAM(
> > ++    [[#include <pthread.h>
> > ++    __thread int a;
> > ++    ]],
> > ++    [a=3D0;])],
> > ++    [ac_cv_have_tls=3Dyes;
> AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Transport
> Layer Security is supported by the system")])
> > ++fi
> > +
> > + dnl
> **************************************************************
> *************
> > + dnl How to do static linking?
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-
> ng/files/configure.patch b/meta-arago-extras/recipes-support/syslog-
> ng/files/configure.patch
> > new file mode 100644
> > index 0000000..109f58c
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/configure.patch
> > @@ -0,0 +1,23 @@
> > +Index: syslog-ng-3.5.4.1/configure.ac
> >
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
> > +--- syslog-ng-3.5.4.1.orig/configure.ac	2014-07-18
> 13:49:36.794141441 +0000
> > ++++ syslog-ng-3.5.4.1/configure.ac	2014-07-18 14:23:57.738197606
> +0000
> > +@@ -8,7 +8,8 @@ dnl SNAPSHOT_VERSION   - snapshot version to add to
> version number
> > + dnl BINARY_BRANCH      - the value is added to all source/binary
> packages
> > + dnl SOURCE_REVISION    - Revision of the source-tree, will added to t=
he
> version string
> > + dnl
> > +-AC_INIT(syslog-ng/main.c)
> > ++AC_INIT(syslog-ng, 3.5.4.1)
> > ++AC_CONFIG_SRCDIR(syslog-ng/main.c)
> > + AC_CONFIG_MACRO_DIR([m4])
> > + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> > +
> > +@@ -53,7 +54,7 @@ else
> > +         CURRDATE=3D`date +"%a, %d %b %Y %H:%M:%S %Z"`
> > + fi
> > +
> > +-AM_INIT_AUTOMAKE($PACKAGE, $VERSION, [foreign no-define subdir-
> objects])
> > ++AM_INIT_AUTOMAKE([foreign no-define subdir-objects])
> > + _AM_PROG_TAR([ustar])
> > + if test -n "$SNAPSHOT_VERSION"; then
> > + 	VERSION=3D$VERSION+$SNAPSHOT_VERSION
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/dbifix.p=
atch
> b/meta-arago-extras/recipes-support/syslog-ng/files/dbifix.patch
> > new file mode 100644
> > index 0000000..15dfb68
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/dbifix.patch
> > @@ -0,0 +1,20 @@
> > +Index: syslog-ng-3.5.4.1/configure.ac
> >
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
> > +--- syslog-ng-3.5.4.1.orig/configure.ac	2014-07-18
> 14:35:03.134215740 +0000
> > ++++ syslog-ng-3.5.4.1/configure.ac	2014-07-18 15:31:52.510308653
> +0000
> > +@@ -576,13 +576,14 @@
> > + dnl
> **************************************************************
> *************
> > +
> > + AC_CHECK_LIB(dl, dlsym, DL_LIBS=3D"-ldl")
> > ++if test "x$enable_sql" !=3D "xno"; then
> > + PKG_CHECK_MODULES(LIBDBI, dbi >=3D $LIBDBI_MIN_VERSION,
> libdbi_pkgconfig_not_found=3D"0", libdbi_pkgconfig_not_found=3D"1")
> > +
> > + if test "$libdbi_pkgconfig_not_found" -eq 1; then
> > + 	dnl if libdbi has no .pc file, try it without one
> > + 	AC_CHECK_LIB(dbi, dbi_initialize, LIBDBI_LIBS=3D"-ldbi";
> LIBDBI_CFLAGS=3D"-I/usr/include")
> > + fi
> > +-
> > ++fi
> > + if test "x$enable_sql" =3D "xauto"; then
> > + 	AC_MSG_CHECKING(whether to enable SQL support)
> > + 	if test "x$LIBDBI_LIBS" !=3D "x"; then
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/deinit-t=
he-
> new-config-when-reverting-to-the.patch b/meta-arago-extras/recipes-
> support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
> > new file mode 100644
> > index 0000000..484af7e
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/deinit-the-new-
> config-when-reverting-to-the.patch
> > @@ -0,0 +1,36 @@
> > +From 86842df8bff5c97e44fc55d2fb7fc6c10f56ab84 Mon Sep 17 00:00:00
> 2001
> > +From: Gergely Nagy <algernon@balabit.hu>
> > +Date: Fri, 13 Dec 2013 13:46:15 +0100
> > +Subject: [PATCH] mainloop: Deinit the new config when reverting to the
> old one
> > +
> > +Upstream-Status: Backport
> > +
> > +When reloading, and the new config fails, deinit it before initializin=
g
> > +the old config. This is so that conflicting things do not remain held =
by
> > +the half-initialized new config, while the old tries to take it
> > +over. (It also removed a couple of memory leaks, most likely.)
> > +
> > +The reason we can do this, is because cfg_tree_stop() (called by
> > +cfg_deinit()) goes over all the known nodes, and log_pipe_deinit() is
> > +also smart enough to not deinit a node that has not been inited before=
.
> > +
> > +Signed-off-by: Gergely Nagy <algernon@balabit.hu>
> > +---
> > + lib/mainloop.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/lib/mainloop.c b/lib/mainloop.c
> > +index 34655fa..e6fbb59 100644
> > +--- a/lib/mainloop.c
> > ++++ b/lib/mainloop.c
> > +@@ -510,6 +510,7 @@ main_loop_reload_config_apply(void)
> > +     {
> > +       msg_error("Error initializing new configuration, reverting to o=
ld
> config", NULL);
> > +       cfg_persist_config_move(main_loop_new_config,
> main_loop_old_config);
> > ++      cfg_deinit(main_loop_new_config);
> > +       if (!cfg_init(main_loop_old_config))
> > +         {
> > +           /* hmm. hmmm, error reinitializing old configuration, we're=
 hosed.
> > +--
> > +1.8.4.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/fix-a-
> memory-leak-in-log_driver_free.patch b/meta-arago-extras/recipes-
> support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
> > new file mode 100644
> > index 0000000..2603474
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/fix-a-memory-
> leak-in-log_driver_free.patch
> > @@ -0,0 +1,33 @@
> > +From a269669ba3cb6d1c06a3322b4a6a035cb787d085 Mon Sep 17
> 00:00:00 2001
> > +From: Gergely Nagy <algernon@balabit.hu>
> > +Date: Tue, 14 Jan 2014 13:58:05 +0100
> > +Subject: [PATCH] driver: Fix a memory leak in log_driver_free()
> > +
> > +Upstream-Status: Backport
> > +
> > +After freeing up the members of self->plugins, free self->plugins itse=
lf
> > +too.
> > +
> > +Signed-off-by: Gergely Nagy <algernon@balabit.hu>
> > +---
> > + lib/driver.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/lib/driver.c b/lib/driver.c
> > +index d77fe57..a6867b9 100644
> > +--- a/lib/driver.c
> > ++++ b/lib/driver.c
> > +@@ -91,6 +91,10 @@ log_driver_free(LogPipe *s)
> > +     {
> > +       log_driver_plugin_free((LogDriverPlugin *) l->data);
> > +     }
> > ++  if (self->plugins)
> > ++    {
> > ++      g_list_free(self->plugins);
> > ++    }
> > +   if (self->group)
> > +     g_free(self->group);
> > +   if (self->id)
> > +--
> > +1.8.4.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/fix-conf=
ig-
> libnet.patch b/meta-arago-extras/recipes-support/syslog-ng/files/fix-conf=
ig-
> libnet.patch
> > new file mode 100644
> > index 0000000..755803c
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/fix-config-
> libnet.patch
> > @@ -0,0 +1,66 @@
> > +Subject: [PATCH] add libnet enable option
> > +
> > +Upstream-Status: Pending
> > +
> > +This would avoid a implicit auto-detecting result.
> > +
> > +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +---
> > + configure.ac |   27 +++++++++++++++++----------
> > + 1 files changed, 17 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index b1e18b4..8e13025 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -73,6 +73,9 @@ AC_CONFIG_HEADERS(config.h)
> > + dnl
> **************************************************************
> *************
> > + dnl Arguments
> > +
> > ++AC_ARG_ENABLE(libnet,
> > ++              [  --enable-libnet      Enable libnet support.],, enabl=
e_libnet=3D"no")
> > ++
> > + AC_ARG_WITH(libnet,
> > +    [  --with-libnet=3Dpath      use path to libnet-config script],
> > +    ,
> > +@@ -768,22 +771,26 @@ dnl
> **************************************************************
> *************
> > + dnl libnet headers/libraries
> > + dnl
> **************************************************************
> *************
> > + AC_MSG_CHECKING(for LIBNET)
> > +-if test "x$with_libnet" =3D "x"; then
> > +-        LIBNET_CONFIG=3D"`which libnet-config`"
> > +-else
> > +-        LIBNET_CONFIG=3D"$with_libnet/libnet-config"
> > +-fi
> > ++if test "x$enable_libnet" =3D xyes; then
> > ++        if test "x$with_libnet" =3D "x"; then
> > ++                LIBNET_CONFIG=3D"`which libnet-config`"
> > ++        else
> > ++                LIBNET_CONFIG=3D"$with_libnet/libnet-config"
> > ++        fi
> > ++
> > ++        if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
> > ++                LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
> > ++                LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
> > ++                AC_MSG_RESULT(yes)
> > ++        else
> > ++                AC_MSG_ERROR([Could not find libnet, and libnet suppo=
rt was
> explicitly enabled.])
> > ++        fi
> > +
> > +-if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
> > +-        LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
> > +-        LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
> > +-        AC_MSG_RESULT(yes)
> > + else
> > +         LIBNET_LIBS=3D
> > +         AC_MSG_RESULT(no)
> > + fi
> > +
> > +-
> > + if test "x$enable_spoof_source" =3D "xauto"; then
> > + 	AC_MSG_CHECKING(whether to enable spoof source support)
> > +         if test "x$LIBNET_LIBS" !=3D "x"; then
> > +--
> > +1.7.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/fix-inva=
lid-
> ownership.patch b/meta-arago-extras/recipes-support/syslog-ng/files/fix-
> invalid-ownership.patch
> > new file mode 100644
> > index 0000000..faf9672
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/fix-invalid-
> ownership.patch
> > @@ -0,0 +1,28 @@
> > +syslog-ng: fix wrong ownership issue
> > +
> > +Upstream-Status: Pending
> > +
> > +The ownership of build user is preserved for some target files, fixed =
it by
> > +adding --no-same-owner option to tar when extracting files.
> > +
> > +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> > +---
> > + scl/Makefile.am |    2 +-
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/scl/Makefile.am b/scl/Makefile.am
> > +index 57fad5d..2a29ca5 100644
> > +--- a/scl/Makefile.am
> > ++++ b/scl/Makefile.am
> > +@@ -14,7 +14,7 @@ scl-install-data-local:
> > + 		fi; \
> > + 	done
> > + 	$(mkinstalldirs) $(DESTDIR)/$(scldir)
> > +-	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldi=
r)
> && tar xf -)
> > ++	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldi=
r)
> && tar xf - --no-same-owner)
> > + 	chmod -R u+rwX $(DESTDIR)/$(scldir)
> > +
> > + scl-uninstall-local:
> > +--
> > +1.7.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/free-glo=
bal-
> LogTemplateOptions.patch b/meta-arago-extras/recipes-support/syslog-
> ng/files/free-global-LogTemplateOptions.patch
> > new file mode 100644
> > index 0000000..d439a26
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/free-global-
> LogTemplateOptions.patch
> > @@ -0,0 +1,30 @@
> > +From 3ef6ca8044260c77118edca6dead807a2edcb5ef Mon Sep 17
> 00:00:00 2001
> > +From: Balazs Scheidler <bazsi@balabit.hu>
> > +Date: Thu, 31 Oct 2013 13:20:12 +0100
> > +Subject: [PATCH] cfg: free global LogTemplateOptions
> > +
> > +Upstream-Status: Backport
> > +
> > +This fixes a potential memory leak when global template specific
> > +options were specified, such as local-time-zone(), send-time-zone() et=
c.
> > +
> > +Signed-off-by: Balazs Scheidler <bazsi@balabit.hu>
> > +---
> > + lib/cfg.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/lib/cfg.c b/lib/cfg.c
> > +index 7f040b8..adeaaf8 100644
> > +--- a/lib/cfg.c
> > ++++ b/lib/cfg.c
> > +@@ -411,6 +411,7 @@ cfg_free(GlobalConfig *self)
> > +   g_free(self->proto_template_name);
> > +   log_template_unref(self->file_template);
> > +   log_template_unref(self->proto_template);
> > ++  log_template_options_destroy(&self->template_options);
> > +
> > +   if (self->bad_hostname_compiled)
> > +     regfree(&self->bad_hostname);
> > +--
> > +1.8.4.1
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/initscri=
pt
> b/meta-arago-extras/recipes-support/syslog-ng/files/initscript
> > new file mode 100644
> > index 0000000..910030f
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/initscript
> > @@ -0,0 +1,62 @@
> > +#! /bin/sh
> > +#
> > +# This is an init script for openembedded
> > +# Copy it to /etc/init.d/syslog-ng and type
> > +# > update-rc.d syslog-ng defaults 5
> > +#
> > +
> > +# Source function library
> > +. /etc/init.d/functions
> > +
> > +syslog_ng=3D/usr/sbin/syslog-ng
> > +test -x "$syslog_ng" || exit 0
> > +
> > +PIDFILE=3D/var/run/syslog-ng/syslog-ng.pid
> > +
> > +create_xconsole() {
> > +  test -e /dev/xconsole || mknod -m 640 /dev/xconsole p
> > +  test -x /sbin/restorecon && /sbin/restorecon /dev/xconsole
> > +}
> > +
> > +RETVAL=3D0
> > +
> > +case "$1" in
> > +  start)
> > +    [ "${VERBOSE}" !=3D "no" ] && echo -n "Starting syslog-ng:"
> > +    create_xconsole
> > +    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $syslo=
g_ng
> > +    [ "${VERBOSE}" !=3D "no" ] && echo "."
> > +    ;;
> > +  stop)
> > +    [ "${VERBOSE}" !=3D "no" ] && echo -n "Stopping syslog-ng:"
> > +    start-stop-daemon --stop --quiet --pidfile $PIDFILE
> > +    [ "${VERBOSE}" !=3D "no" ] && echo "."
> > +    ;;
> > +  reload|force-reload)
> > +    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
> > +    ;;
> > +  restart)
> > +    echo "Stopping syslog-ng:"
> > +    start-stop-daemon --stop --quiet --pidfile $PIDFILE
> > +    echo -n "Waiting for syslog-ng to die off"
> > +    for i in 1 2 3 ;
> > +    do
> > +        sleep 1
> > +        echo -n "."
> > +    done
> > +    echo ""
> > +    echo -n "Starting syslog-ng:"
> > +    create_xconsole
> > +    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $syslo=
g_ng
> > +    echo "."
> > +    ;;
> > +  status)
> > +    status $syslog_ng
> > +    RETVAL=3D$?
> > +    ;;
> > +  *)
> > +    echo "Usage: $0 {start|stop|reload|restart|force-reload|status}"
> > +    exit 1
> > +esac
> > +
> > +exit $RETVAL
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/logwrite=
r-
> dont-allocate-a-new-buffer.patch b/meta-arago-extras/recipes-
> support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
> > new file mode 100644
> > index 0000000..9e3d64b
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/logwriter-dont-
> allocate-a-new-buffer.patch
> > @@ -0,0 +1,26 @@
> > +logwriter: Don't allocate a new buffer if fails to consume current ite=
m
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +---
> > +--- a/lib/logwriter.c
> > ++++ b/lib/logwriter.c
> > +@@ -1010,7 +1010,7 @@
> > +         {
> > +           status =3D log_proto_client_post(proto, (guchar *) self->li=
ne_buffer-
> >str, self->line_buffer->len, &consumed);
> > +
> > +-          if (consumed)
> > ++          if (consumed && status !=3D LPS_ERROR)
> > +             log_writer_realloc_line_buffer(self);
> > +
> > +           if (status =3D=3D LPS_ERROR)
> > +@@ -1028,7 +1028,7 @@
> > +                     NULL);
> > +           consumed =3D TRUE;
> > +         }
> > +-      if (consumed)
> > ++      if (consumed && status !=3D LPS_ERROR)
> > +         {
> > +           if (lm->flags & LF_LOCAL)
> > +             step_sequence_number(&self->seq_num);
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/rewrite-=
expr-
> grammar.ym-Free-up-token.patch b/meta-arago-extras/recipes-
> support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
> > new file mode 100644
> > index 0000000..1951af9
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/rewrite-expr-
> grammar.ym-Free-up-token.patch
> > @@ -0,0 +1,17 @@
> > +rewrite-expr-grammar.ym: Free up token.
> > +
> > +Upsteam-Status: Backport
> > +
> > +Reported-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +Signed-off-by: Viktor Tusa <tusavik@gmail.com>
> > +---
> > +--- a/lib/rewrite/rewrite-expr-grammar.ym
> > ++++ b/lib/rewrite/rewrite-expr-grammar.ym
> > +@@ -78,6 +78,7 @@
> > +
> > + 	    $$ =3D log_template_new(configuration, $1);
> > + 	    CHECK_ERROR(log_template_compile($$, $1, &error), @1, "Error
> compiling template (%s)", error->message);
> > ++            free($1);
> > + 	  }
> > + 	;
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/still-fr=
ee-the-
> unconsumed-item.patch b/meta-arago-extras/recipes-support/syslog-
> ng/files/still-free-the-unconsumed-item.patch
> > new file mode 100644
> > index 0000000..ea18682
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/still-free-the-
> unconsumed-item.patch
> > @@ -0,0 +1,90 @@
> > +From 365020c5c0823c91a8011e34597f970a7cfb4fb3 Mon Sep 17
> 00:00:00 2001
> > +From: Tusa Viktor <tusavik@gmail.com>
> > +Date: Wed, 23 Apr 2014 17:10:58 +0000
> > +Subject: [PATCH] logwriter: still free the unconsumed item during
> reloading
> > + configuration
> > +
> > +Upstream-Status: Backport
> > +
> > +Otherwise we have no chance to free this stuff.
> > +
> > +Reported-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +Signed-off-by: Tusa Viktor <tusavik@gmail.com>
> > +Signed-off-by: Gergely Nagy <algernon@madhouse-project.org>
> > +---
> > + lib/logproto/logproto-client.h      |    2 +-
> > + lib/logproto/logproto-text-client.c |   11 +++++++++++
> > + lib/logwriter.c                     |    9 +++++++--
> > + 3 files changed, 19 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/lib/logproto/logproto-client.h b/lib/logproto/logproto-cl=
ient.h
> > +index 254ecf9..5adc917 100644
> > +--- a/lib/logproto/logproto-client.h
> > ++++ b/lib/logproto/logproto-client.h
> > +@@ -47,7 +47,6 @@ void
> log_proto_client_options_defaults(LogProtoClientOptions *options);
> > + void log_proto_client_options_init(LogProtoClientOptions *options,
> GlobalConfig *cfg);
> > + void log_proto_client_options_destroy(LogProtoClientOptions
> *options);
> > +
> > +-
> > + struct _LogProtoClient
> > + {
> > +   LogProtoStatus status;
> > +@@ -107,6 +106,7 @@ log_proto_client_reset_error(LogProtoClient *s)
> > + gboolean log_proto_client_validate_options(LogProtoClient *self);
> > + void log_proto_client_init(LogProtoClient *s, LogTransport *transport=
,
> const LogProtoClientOptions *options);
> > + void log_proto_client_free(LogProtoClient *s);
> > ++void log_proto_client_free_method(LogProtoClient *s);
> > +
> > + #define DEFINE_LOG_PROTO_CLIENT(prefix) \
> > +   static gpointer                                                    =
   \
> > +diff --git a/lib/logproto/logproto-text-client.c b/lib/logproto/logpro=
to-
> text-client.c
> > +index 3248759..a5100f3 100644
> > +--- a/lib/logproto/logproto-text-client.c
> > ++++ b/lib/logproto/logproto-text-client.c
> > +@@ -146,12 +146,23 @@ log_proto_text_client_post(LogProtoClient *s,
> guchar *msg, gsize msg_len, gboole
> > + }
> > +
> > + void
> > ++log_proto_text_client_free(LogProtoClient *s)
> > ++{
> > ++  LogProtoTextClient *self =3D (LogProtoTextClient *)s;
> > ++  if (self->partial_free)
> > ++    self->partial_free(self->partial);
> > ++  self->partial =3D NULL;
> > ++  log_proto_client_free_method(s);
> > ++};
> > ++
> > ++void
> > + log_proto_text_client_init(LogProtoTextClient *self, LogTransport
> *transport, const LogProtoClientOptions *options)
> > + {
> > +   log_proto_client_init(&self->super, transport, options);
> > +   self->super.prepare =3D log_proto_text_client_prepare;
> > +   self->super.flush =3D log_proto_text_client_flush;
> > +   self->super.post =3D log_proto_text_client_post;
> > ++  self->super.free_fn =3D log_proto_text_client_free;
> > +   self->super.transport =3D transport;
> > +   self->next_state =3D -1;
> > + }
> > +diff --git a/lib/logwriter.c b/lib/logwriter.c
> > +index 3292e31..470bcdb 100644
> > +--- a/lib/logwriter.c
> > ++++ b/lib/logwriter.c
> > +@@ -1063,8 +1063,13 @@ log_writer_flush(LogWriter *self,
> LogWriterFlushMode flush_mode)
> > +         }
> > +       else
> > +         {
> > +-          /* push back to the queue */
> > +-          log_queue_push_head(self->queue, lm, &path_options);
> > ++          if (flush_mode =3D=3D LW_FLUSH_QUEUE)
> > ++            log_msg_unref(lm);
> > ++          else
> > ++            {
> > ++              /* push back to the queue */
> > ++              log_queue_push_head(self->queue, lm, &path_options);
> > ++            }
> > +           msg_set_context(NULL);
> > +           log_msg_refcache_stop();
> > +           break;
> > +--
> > +1.7.10.4
> > +
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/syslog-n=
g-
> verify-the-list-before-del.patch b/meta-arago-extras/recipes-support/sysl=
og-
> ng/files/syslog-ng-verify-the-list-before-del.patch
> > new file mode 100644
> > index 0000000..e8119b8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/syslog-ng-verif=
y-
> the-list-before-del.patch
> > @@ -0,0 +1,38 @@
> > +Verify the validity of the pointer before delete it
> > +
> > +Otherwise, we got a crash at logqueue-fifo.c:344
> > +  344 iv_list_del(&node->list);
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +---
> > +--- a/lib/logqueue-fifo.c
> > ++++ b/lib/logqueue-fifo.c
> > +@@ -339,15 +339,18 @@
> > +       *msg =3D node->msg;
> > +       path_options->ack_needed =3D node->ack_needed;
> > +       self->qoverflow_output_len--;
> > +-      if (!push_to_backlog)
> > ++      if ((&node->list) && (&node->list)->next && (&node->list)->prev=
)
> > +         {
> > +-          iv_list_del(&node->list);
> > +-          log_msg_free_queue_node(node);
> > +-        }
> > +-      else
> > +-        {
> > +-          iv_list_del_init(&node->list);
> > +-        }
> > ++          if (!push_to_backlog)
> > ++            {
> > ++              iv_list_del(&node->list);
> > ++              log_msg_free_queue_node(node);
> > ++            }
> > ++          else
> > ++            {
> > ++              iv_list_del_init(&node->list);
> > ++            }
> > ++        }
> > +     }
> > +   else
> > +     {
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/files/syslog-
> ng.conf b/meta-arago-extras/recipes-support/syslog-ng/files/syslog-ng.con=
f
> > new file mode 100644
> > index 0000000..f0da2b7
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/files/syslog-ng.conf
> > @@ -0,0 +1,155 @@
> > +@version: 3.5
> > +#
> > +# Syslog-ng configuration file, compatible with default Debian syslogd
> > +# installation. Originally written by anonymous (I can't find his name=
)
> > +# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
> > +
> > +# First, set some global options.
> > +options { chain_hostnames(off); flush_lines(0); use_dns(no);
> use_fqdn(no);
> > +	  owner("root"); group("adm"); perm(0640); stats_freq(0);
> > +	  bad_hostname("^gconfd$");
> > +};
> > +
> > +########################
> > +# Sources
> > +########################
> > +# This is the default behavior of sysklogd package
> > +# Logs may come from unix stream, but not from another machine.
> > +#
> > +source s_src { unix-dgram("/dev/log"); internal();
> > +       	     file("/proc/kmsg" program_override("kernel"));
> > +};
> > +
> > +# If you wish to get logs from remote machine you should uncomment
> > +# this and comment the above source line.
> > +#
> > +#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required)
> encrypt(allow)); };
> > +
> > +########################
> > +# Destinations
> > +########################
> > +# First some standard logfile
> > +#
> > +destination d_auth { file("/var/log/auth.log"); };
> > +destination d_cron { file("/var/log/cron.log"); };
> > +destination d_daemon { file("/var/log/daemon.log"); };
> > +destination d_kern { file("/var/log/kern.log"); };
> > +destination d_lpr { file("/var/log/lpr.log"); };
> > +destination d_mail { file("/var/log/mail.log"); };
> > +destination d_syslog { file("/var/log/syslog"); };
> > +destination d_user { file("/var/log/user.log"); };
> > +destination d_uucp { file("/var/log/uucp.log"); };
> > +
> > +# This files are the log come from the mail subsystem.
> > +#
> > +destination d_mailinfo { file("/var/log/mail/mail.info"); };
> > +destination d_mailwarn { file("/var/log/mail/mail.warn"); };
> > +destination d_mailerr { file("/var/log/mail/mail.err"); };
> > +
> > +# Logging for INN news system
> > +#
> > +destination d_newscrit { file("/var/log/news/news.crit"); };
> > +destination d_newserr { file("/var/log/news/news.err"); };
> > +destination d_newsnotice { file("/var/log/news/news.notice"); };
> > +
> > +# Some `catch-all' logfiles.
> > +#
> > +destination d_debug { file("/var/log/debug"); };
> > +destination d_error { file("/var/log/error"); };
> > +destination d_messages { file("/var/log/messages"); };
> > +
> > +# The root's console.
> > +#
> > +destination d_console { usertty("root"); };
> > +
> > +# Virtual console.
> > +#
> > +destination d_console_all { file("/dev/tty10"); };
> > +
> > +# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
> > +# you must invoke nsole' with the -file' option:
> > +#
> > +#    $ xconsole -file /dev/xconsole [...]
> > +#
> > +destination d_xconsole { pipe("/dev/xconsole"); };
> > +
> > +# Send the messages to an other host
> > +#
> > +#destination d_net { tcp("127.0.0.1" port(1000) authentication(on)
> encrypt(on) log_fifo_size(1000)); };
> > +
> > +# Debian only
> > +destination d_ppp { file("/var/log/ppp.log"); };
> > +
> > +########################
> > +# Filters
> > +########################
> > +# Here's come the filter options. With this rules, we can set which
> > +# message go where.
> > +
> > +filter f_dbg { level(debug); };
> > +filter f_info { level(info); };
> > +filter f_notice { level(notice); };
> > +filter f_warn { level(warn); };
> > +filter f_err { level(err); };
> > +filter f_crit { level(crit .. emerg); };
> > +
> > +filter f_debug { level(debug) and not facility(auth, authpriv, news, m=
ail); };
> > +filter f_error { level(err .. emerg) ; };
> > +filter f_messages { level(info,notice,warn) and
> > +                    not facility(auth,authpriv,cron,daemon,mail,news);=
 };
> > +
> > +filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
> > +filter f_cron { facility(cron) and not filter(f_debug); };
> > +filter f_daemon { facility(daemon) and not filter(f_debug); };
> > +filter f_kern { facility(kern) and not filter(f_debug); };
> > +filter f_lpr { facility(lpr) and not filter(f_debug); };
> > +filter f_local { facility(local0, local1, local3, local4, local5,
> > +                        local6, local7) and not filter(f_debug); };
> > +filter f_mail { facility(mail) and not filter(f_debug); };
> > +filter f_news { facility(news) and not filter(f_debug); };
> > +filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f=
_debug);
> };
> > +filter f_user { facility(user) and not filter(f_debug); };
> > +filter f_uucp { facility(uucp) and not filter(f_debug); };
> > +
> > +filter f_cnews { level(notice, err, crit) and facility(news); };
> > +filter f_cother { level(debug, info, notice, warn) or facility(daemon,=
 mail);
> };
> > +
> > +filter f_ppp { facility(local2) and not filter(f_debug); };
> > +filter f_console { level(warn .. emerg); };
> > +
> > +########################
> > +# Log paths
> > +########################
> > +log { source(s_src); filter(f_auth); destination(d_auth); };
> > +log { source(s_src); filter(f_cron); destination(d_cron); };
> > +log { source(s_src); filter(f_daemon); destination(d_daemon); };
> > +log { source(s_src); filter(f_kern); destination(d_kern); };
> > +log { source(s_src); filter(f_lpr); destination(d_lpr); };
> > +log { source(s_src); filter(f_syslog3); destination(d_syslog); };
> > +log { source(s_src); filter(f_user); destination(d_user); };
> > +log { source(s_src); filter(f_uucp); destination(d_uucp); };
> > +
> > +log { source(s_src); filter(f_mail); destination(d_mail); };
> > +#log { source(s_src); filter(f_mail); filter(f_info); destination(d_ma=
ilinfo); };
> > +#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_ma=
ilwarn);
> };
> > +#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mai=
lerr); };
> > +
> > +log { source(s_src); filter(f_news); filter(f_crit); destination(d_new=
scrit); };
> > +log { source(s_src); filter(f_news); filter(f_err); destination(d_news=
err); };
> > +log { source(s_src); filter(f_news); filter(f_notice);
> destination(d_newsnotice); };
> > +#log { source(s_src); filter(f_cnews); destination(d_console_all); };
> > +#log { source(s_src); filter(f_cother); destination(d_console_all); };
> > +
> > +#log { source(s_src); filter(f_ppp); destination(d_ppp); };
> > +
> > +log { source(s_src); filter(f_debug); destination(d_debug); };
> > +log { source(s_src); filter(f_error); destination(d_error); };
> > +log { source(s_src); filter(f_messages); destination(d_messages); };
> > +
> > +log { source(s_src); filter(f_console); destination(d_console_all);
> > +				    destination(d_xconsole); };
> > +log { source(s_src); filter(f_crit); destination(d_console); };
> > +
> > +# All messages send to a remote site
> > +#
> > +#log { source(s_src); destination(d_net); };
> > diff --git a/meta-arago-extras/recipes-support/syslog-
> ng/files/volatiles.03_syslog-ng b/meta-arago-extras/recipes-support/syslo=
g-
> ng/files/volatiles.03_syslog-ng
> > new file mode 100644
> > index 0000000..3c4a50d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-
> ng/files/volatiles.03_syslog-ng
> > @@ -0,0 +1 @@
> > +d root root 0755 /var/run/syslog-ng none
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-arago-extras/recipes-support/syslog-ng/syslog-ng.inc
> > new file mode 100644
> > index 0000000..984af43
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/syslog-ng.inc
> > @@ -0,0 +1,106 @@
> > +SUMMARY =3D "Alternative system logger daemon"
> > +DESCRIPTION =3D "syslog-ng, as the name shows, is a syslogd replacemen=
t, \
> > +but with new functionality for the new generation. The original syslog=
d \
> > +allows messages only to be sorted based on priority/facility pairs; \
> > +syslog-ng adds the possibility to filter based on message contents usi=
ng \
> > +regular expressions. The new configuration scheme is intuitive and
> powerful. \
> > +Forwarding logs over TCP and remembering all forwarding hops makes it =
\
> > +ideal for firewalled environments. \
> > +"
> > +HOMEPAGE =3D "http://www.balabit.com/network-security/syslog-
> ng/opensource-logging-system"
> > +
> > +LICENSE =3D "GPLv2 & LGPLv2.1"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3De0e8658d9be248f01b7933df24dc1408"
> > +
> > +DEPENDS =3D "flex eventlog glib-2.0"
> > +
> > +SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-
> ng/sources/${PV}/source/${BPN}_${PV}.tar.gz \
> > +           file://syslog-ng.conf \
> > +           file://initscript \
> > +           file://volatiles.03_syslog-ng \
> > +           file://configure.ac-add-option-enable-thread-tls-to-manage-=
.patch \
> > +"
> > +
> > +inherit autotools systemd pkgconfig update-rc.d update-alternatives
> > +
> > +EXTRA_OECONF =3D " \
> > +    --enable-dynamic-linking \
> > +    --disable-sub-streams \
> > +    --disable-pacct \
> > +    --localstatedir=3D${localstatedir}/run/${BPN} \
> > +    --sysconfdir=3D${sysconfdir}/${BPN} \
> > +    --with-module-dir=3D${libdir}/${BPN} \
> > +    --with-sysroot=3D${STAGING_DIR_HOST} \
> > +    --with-libmongo-client=3Dno --disable-mongodb \
> > +    --with-librabbitmq-client=3Dno \
> > +    ${CONFIG_TLS} \
> > +"
> > +
> > +CONFIG_TLS =3D "--enable-thread-tls"
> > +CONFIG_TLS_arm =3D "${@base_conditional( "DEBUG_BUILD", "1", " --
> disable-thread-tls", " --enable-thread-tls", d )}"
> > +
> > +PACKAGECONFIG ??=3D "openssl \
> > +    ${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
> > +    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} =
\
> > +"
> > +PACKAGECONFIG[openssl] =3D "--enable-ssl,--disable-ssl,openssl,"
> > +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,,"
> > +PACKAGECONFIG[systemd] =3D "--enable-systemd --with-
> systemdsystemunitdir=3D${systemd_unitdir}/system/,--disable-systemd --
> without-systemdsystemunitdir,systemd,"
> > +PACKAGECONFIG[linux-caps] =3D "--enable-linux-caps,--disable-linux-
> caps,libcap,"
> > +PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre,"
> > +PACKAGECONFIG[dbi] =3D "--enable-sql,--disable-sql,libdbi,"
> > +PACKAGECONFIG[libnet] =3D "--enable-libnet --with-
> libnet=3D${STAGING_BINDIR_CROSS},--disable-libnet,libnet,"
> > +PACKAGECONFIG[smtp] =3D "--enable-smtp --with-
> libesmtp=3D${STAGING_LIBDIR},--disable-smtp,libesmtp,"
> > +PACKAGECONFIG[json] =3D "--enable-json,--disable-json,json-c,"
> > +PACKAGECONFIG[tcp-wrapper] =3D "--enable-tcp-wrapper,--disable-tcp-
> wrapper,tcp-wrappers,"
> > +
> > +do_configure_prepend() {
> > +    eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i=
 -e "s/-
> D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=3D64//"
> ${S}/configure.in', d)}"
> > +}
> > +
> > +do_install_append() {
> > +    install -d ${D}/${sysconfdir}/${BPN}
> > +    install ${WORKDIR}/syslog-ng.conf
> ${D}${sysconfdir}/${BPN}/${BPN}.conf
> > +    install -d ${D}/${sysconfdir}/init.d
> > +    install -m 755 ${WORKDIR}/initscript
> ${D}/${sysconfdir}/init.d/syslog.${BPN}
> > +    install -d ${D}/${sysconfdir}/default/volatiles/
> > +    install -m 755 ${WORKDIR}/volatiles.03_syslog-ng
> ${D}/${sysconfdir}/default/volatiles/03_syslog-ng
> > +
> > +    # Remove /var/run as it is created on startup
> > +    rm -rf ${D}${localstatedir}/run
> > +}
> > +
> > +FILES_${PN} +=3D "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/to=
ols"
> > +RDEPENDS_${PN} +=3D "gawk"
> > +
> > +# This overcomes the syslog-ng rdepends on syslog-ng-dev QA Error
> > +PACKAGES =3D+ "${PN}-libs ${PN}-libs-dev ${PN}-libs-dbg"
> > +FILES_${PN}-libs =3D "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.s=
o*"
> > +FILES_${PN}-libs-dev =3D "${libdir}/${BPN}/lib*.la"
> > +FILES_${PN}-libs-dbg =3D "${libdir}/${BPN}/.debug"
> > +INSANE_SKIP_${PN}-libs =3D "dev-so"
> > +RDEPENDS_${PN} +=3D "${PN}-libs"
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
> > +
> > +# syslog initscript is handled explicitly because order of
> > +# update-rc.d and update-alternatives is important
> > +RDEPENDS_${PN} +=3D "
> ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "",
> "update-rc.d", d)}"
> > +
> > +RPROVIDES_${PN} +=3D "${PN}-systemd"
> > +RREPLACES_${PN} +=3D "${PN}-systemd"
> > +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> > +SYSTEMD_SERVICE_${PN} =3D "${BPN}.service"
> > +
> > +# no syslog-init for systemd
> > +python () {
> > +    if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
> > +        pn =3D d.getVar('PN', True)
> > +        sysconfdir =3D d.getVar('sysconfdir', True)
> > +        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
> > +        d.setVarFlag('ALTERNATIVE_PRIORITY', 'syslog-init', '200')
> > +        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init',
> '%s/init.d/syslog' % (sysconfdir))
> > +}
> > +
> > +INITSCRIPT_NAME =3D "syslog"
> > +INITSCRIPT_PARAMS =3D "start 20 2 3 4 5 . stop 90 0 1 6 ."
> > diff --git a/meta-arago-extras/recipes-support/syslog-ng/syslog-
> ng_3.5.4.1.bb b/meta-arago-extras/recipes-support/syslog-ng/syslog-
> ng_3.5.4.1.bb
> > new file mode 100644
> > index 0000000..b548420
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
> > @@ -0,0 +1,21 @@
> > +require syslog-ng.inc
> > +
> > +SRC_URI +=3D " \
> > +    file://afsql-afsql_dd_insert_db-refactor.patch \
> > +    file://deinit-the-new-config-when-reverting-to-the.patch \
> > +    file://fix-a-memory-leak-in-log_driver_free.patch \
> > +    file://fix-config-libnet.patch \
> > +    file://fix-invalid-ownership.patch \
> > +    file://Fix-the-memory-leak-problem-for-mutex.patch \
> > +    file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-
> defined.patch \
> > +    file://free-global-LogTemplateOptions.patch \
> > +    file://still-free-the-unconsumed-item.patch \
> > +    file://syslog-ng-verify-the-list-before-del.patch \
> > +    file://configure.patch \
> > +    file://dbifix.patch \
> > +    file://rewrite-expr-grammar.ym-Free-up-token.patch \
> > +    file://logwriter-dont-allocate-a-new-buffer.patch \
> > +"
> > +
> > +SRC_URI[md5sum] =3D "ff3bf223ebafbaa92b69a2d5b729f368"
> > +SRC_URI[sha256sum] =3D
> "92c6969e4172b4fd32390f80043b4de7b116f29989d8c2e5a8a687ee6dcd6f6
> 6"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

